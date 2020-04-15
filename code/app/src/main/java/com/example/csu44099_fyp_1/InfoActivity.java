package com.example.csu44099_fyp_1;

import android.content.DialogInterface;
import android.graphics.Color;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;

public class InfoActivity extends AppCompatActivity {

    private Sample sample;
    private final int cropX = 0;
    private final int cropY = 120;
    private final int cropHeight = 680;

    // Toggle between test types
    boolean type = false;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        sample = getIntent().getParcelableExtra("ex");

        setContentView(R.layout.activity_info);

        // Update UI with this sample's info
        TextView textView4 = this.findViewById(R.id.textView4);
        textView4.setText(sample.getSamplepH());

        ImageView imageView = this.findViewById(R.id.imageView);
        imageView.setImageBitmap(sample.getSampleThumbnail());

        // --- Perform image processing (includes UI updates) ---

        Image image = new Image(sample.getSampleLocation());
        image.setHeight(cropX, cropY, cropHeight);
        image.toGreyscale();
        Histogram histogram = new Histogram(image);
        histogram.smooth();
        histogram.threshold(image);

        // Show binary image on UI
        Image image1 = new Image(sample.getSampleLocation());
        image1.setHeight(cropX, cropY, cropHeight);
        image1.toGreyscale();
        histogram.threshold(image1);
        ImageView imageView3 = this.findViewById(R.id.imageView3);
        imageView3.setImageBitmap(image1.getImage());

        // Locate the strip
        ArrayList<Pixel> strip = getStrip(image);

        float average1;
        float average2;
        float average3;
        float average4;

        // Get average hue of panel 1
        ArrayList<Pixel> panel = getPanel(strip,1, image);
        average1 = average(panel);

        // Get average hue of panel 2
        panel = getPanel(strip,2, image);
        average2 = average(panel);

        // Get average hue of panel 3
        panel = getPanel(strip,3, image);
        average3 = average(panel);

        // Get average hue of panel 4
        panel = getPanel(strip,4, image);
        average4 = average(panel);

        // --- Check if acidic/neutral/basic
        getType(average2);

        if (type == false) {
            // --- Determine pH value using sum curve
            int result = getpHSum(average1, average2, average3, average4);
            if(result == 0 || result == 1 || result == 2 || result == 3) {
                textView4.setText("0-3" + ".");
            } else if(result == 11 || result == 12 || result == 13 || result == 14) {
               textView4.setText("11-14" + ".");
            } else {
                textView4.setText(result + ".");
            }

        } else {
            // --- Determine pH value using regular curve
            getpH(average1, average2, average3, average4);
        }

    }

    // --- Find pixels of interest (gets black pixels from binary image)
    private ArrayList<Pixel> getStrip(Image image) {

        // Update more of the UI
        TextView textView2 = this.findViewById(R.id.textView2);
        String size = Integer.toString(image.getWidth());
        size = size + "x" + Integer.toString(image.getHeight()) + "px";

        textView2.setText(size);

        // --- Extract pixels of interest
        Image original = new Image(sample.getSampleLocation());
        original.setHeight(cropX,cropY,cropHeight);

        // List to contain pixels of interest
        ArrayList<Pixel> pixels = new ArrayList<>();

        for(int i = 0; i < image.getHeight(); i++) {
            for(int j = 0; j < image.getWidth(); j++) {

                int pixelOriginal = original.getPixel(j,i);
                int pixel = image.getPixel(j,i);

                // Check if black pixel
                if(pixel == 0xFF000000) {

                    // Create a new pixel with original colour
                    int[] location = {j,i};
                    Pixel pixelNew = new Pixel(location, pixelOriginal);

                    pixels.add(pixelNew);
                }
            }
        }
        return pixels;
    }

    // --- Image segmentation
    private ArrayList<Pixel> getPanel(ArrayList<Pixel> pixels, int panelNo, Image image) {

        // List to contain panel pixels
        ArrayList<Pixel> result = new ArrayList<>();

        int panelSize = pixels.size() / 4;

        for(int i = 0; i < pixels.size(); i++) {

            Pixel pixel = pixels.get(i);

            if(i <= panelSize && panelNo == 1) {
                // Panel 1
                int[] location = pixel.getLocation();

                image.setPixel(location[0],location[1], Color.BLUE);

                result.add(pixel);

            } else if((i >= panelSize) && (i <= panelSize*2) && panelNo == 2) {
                // Panel 2
                int[] location = pixel.getLocation();

                image.setPixel(location[0],location[1], Color.RED);

                result.add(pixel);

            } else if((i >= panelSize*2) && (i <= panelSize*3) && panelNo == 3) {
                // Panel 3
                int[] location = pixel.getLocation();

                image.setPixel(location[0],location[1], Color.GREEN);

                result.add(pixel);

            } else if((i >= panelSize*3) && (i <= panelSize*4) && panelNo == 4) {
                // Panel 4
                int[] location = pixel.getLocation();

                image.setPixel(location[0],location[1], Color.GRAY);

                result.add(pixel);

            }
        }

        int third = result.size() / 3;

        ArrayList<Pixel> result2 = new ArrayList<>();
        for(int i = third; i < result.size() - third; i++) {
            result2.add(result.get(i));
        }

        // Update the UI with the segmentation result
        ImageView imageView2 = this.findViewById(R.id.imageView2);
        imageView2.setImageBitmap(image.getImage());

        return result2;
    }

    private float average(ArrayList<Pixel> pixels) {

        Float sum = (float)0;

        for(int i = 0; i < pixels.size(); i++) {

            Pixel pixel = pixels.get(i);
            Float hue = pixel.getH();

            sum = sum + hue;
        }

        float average = sum / pixels.size();

        return average;
    }

    private String getType(float average2) {

        PH hue = new PH();

        TextView textView8 = this.findViewById(R.id.textView8);

        if(average2 < hue.L7) {
            textView8.setText("ACID");
            return "ACID";
        }

        if(average2 >= hue.L7 && average2 <= hue.H7) {
            textView8.setText("NEUT");
            return "NEUTRAL";
        }

        if(average2 > hue.H7 ) {
            textView8.setText("BASE");
            return "BASE";
        }

        return "FAIL";
    }

    private int getpHSum(float average1, float average2, float average3, float average4) {
        Float sum = average1 + average2 + average3 + average4;
        float min = Float.MAX_VALUE;
        PHSum value = new PHSum();
        int index = 0;
        for(int i = 0; i < value.SUM.length; i++) {
            float dif = value.SUM[i] - sum;
            float absDif = Math.abs(dif);
            if(absDif < min) {
                min = absDif;
                index = i;
            }
        }
        return index;
    }

    private int getpH(float average1, float average2, float average3, float average4) {

        PH hue = new PH();

        TextView textView4 = this.findViewById(R.id.textView4);

        Log.d("avg1", Float.toString(average1));
        Log.d("avg2", Float.toString(average2));
        Log.d("avg3", Float.toString(average3));
        Log.d("avg4", Float.toString(average4));

        int pH = -1;

        if(average3 - average4 > 23.0237 && (average3 - average4 <= 35.8281)
            && (average4 - average1 > 0)) {
            textView4.setText("4");
            return 4;
        }

        if(average2 >= hue.L6 && average2 < hue.H6) {
            textView4.setText("6");
            return 6;
        }

        if(average2 >= hue.L7 && average2 < hue.H7) {
            textView4.setText("7");
            return 7;
        }

        if(average2 >= hue.L8 && average2 < hue.H8) {
            textView4.setText("8");
            return 8;
        }

        if(average2 >= hue.L9 && average2 < hue.H9) {
            textView4.setText("9");
            return 9;
        }

        if(average3 <= hue.H10 || average3 >= hue.L10) {
            textView4.setText("10");
            return 10;
        }

        if((average4 - average1) >= 0) {
            textView4.setText("0-3");
            return 123;
        }

        if(average2 <= hue.H5) {
            textView4.setText("5");
            return 5;
        }

        if(average4 >= hue.L11) {
            textView4.setText("11");
            return 11;
        }

        if(average4 >= hue.L12 && average4 < hue.H12) {
            textView4.setText("12");
            return 12;
        }

        if(average4 >= hue.L13 && average4 < hue.H13) {
            textView4.setText("13");
            return 13;
        }

        if(average4 <= hue.H14) {
            textView4.setText("14");
            return 14;
        }

        return pH;
    }

    // Save Pixel using HSL to file
    private void save(ArrayList<Pixel> topPanel) {
        try {
            File textFile = new File(getFilesDir(), "HSLValues.csv");
            if (!textFile.exists()) {
                textFile.createNewFile();
            }

            BufferedWriter writer = new BufferedWriter(new FileWriter(textFile, true ));

            for(int i = 0; i < topPanel.size(); i++) {
                Pixel pixel = topPanel.get(i);
                writer.write(pixel.getHSL() + "\n");
            }
            writer.close();
        }
        catch (IOException e) {
            Log.e("Error", "Writing file");
        }
    }

    public void delete(View view) {
        MaterialAlertDialogBuilder dialogDelete = new MaterialAlertDialogBuilder(this);
        dialogDelete.setTitle("Delete sample?");
        dialogDelete.setMessage("This will delete the current sample.");
        dialogDelete.setPositiveButton(R.string.delete, new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                File file = new File(sample.getSampleLocation());
                file.delete();
                finish();
            }
        });
        dialogDelete.setNegativeButton(R.string.action_cancel,null);
        dialogDelete.show();
    }
}
