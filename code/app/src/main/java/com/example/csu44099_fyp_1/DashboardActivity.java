package com.example.csu44099_fyp_1;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.provider.MediaStore;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.ProgressBar;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.core.content.FileProvider;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton;
import static android.media.ThumbnailUtils.extractThumbnail;

public class DashboardActivity extends AppCompatActivity {

    // Set to false to run app as normal. Set to true to run app testing
    private final boolean TEST = false;

    static final int REQUEST_IMAGE_CAPTURE = 1;

    private String currentImagePath;
    private String currentImageName;

    DashboardArrayAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        if(TEST == false) {
            listSamples();
        } else {
            setContentView(R.layout.activity_dashboard);
            TaskTest task = new TaskTest();
            task.execute();
        }
    }

    public void okay(View view) {
       CardView cardView = findViewById(R.id.banner);
       cardView.setVisibility(View.INVISIBLE);
    }

    private void listSamples() {
        File directory = this.getFilesDir();
        File[] files = directory.listFiles();

        if(files.length == 0) {
            setContentView(R.layout.dashboard_empty_state);
        } else {
            setContentView(R.layout.activity_dashboard);
            TaskGetFiles task = new TaskGetFiles();
            task.execute();
        }
    }

    public void dispatchTakePictureIntent(View view) {
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);

        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {

            File imageFilename = null;
            try {
                imageFilename = createTempExternalImageFile();
            } catch (IOException e) {
                e.printStackTrace();
            }

            if (imageFilename != null) {
                Uri imageURI = FileProvider.getUriForFile(this,
                        "com.example.csu44099_fyp_1.fileprovider",
                        imageFilename);
                takePictureIntent.putExtra(MediaStore.EXTRA_OUTPUT, imageURI);
                startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode,resultCode,data);

        if(requestCode == REQUEST_IMAGE_CAPTURE && resultCode == RESULT_OK) {

            Bitmap b = BitmapFactory.decodeFile(currentImagePath);
            File imageFile = createTempImageFile(currentImageName);

            try {
                FileOutputStream o = new FileOutputStream(imageFile);

                b.compress(Bitmap.CompressFormat.JPEG, 100, o);

                o.flush();
                o.close();

                if(TEST == false) {
                    listSamples();
                }

            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        listSamples();
    }

    private File createTempExternalImageFile() throws IOException {
        String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
        currentImageName = "JPEG_" + timeStamp + "_1";

        File directory = getExternalFilesDir(Environment.DIRECTORY_PICTURES);

        File image = File.createTempFile(currentImageName, ".jpg",directory);
        currentImagePath = image.getAbsolutePath();

        return image;
    }

    private File createTempImageFile(String fileName) {
        File directory = this.getFilesDir();
        File imageFile;

        try {
            imageFile = File.createTempFile(fileName,".jpg",directory);
            return imageFile;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }

    private class TaskGetFiles extends AsyncTask<Void,Boolean,ArrayList<Sample>> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            ExtendedFloatingActionButton btnSend1 = findViewById(R.id.addSample);
            btnSend1.setVisibility(View.INVISIBLE);
        }

        @Override
        protected ArrayList<Sample> doInBackground(Void... voids) {

            File directory = getApplicationContext().getFilesDir();
            File[] files = directory.listFiles();

            ArrayList<Sample> sDataset = new ArrayList<Sample>();

            for(int i = 0; i <files.length; i++) {
                File existing = files[i];

                Bitmap b = BitmapFactory.decodeFile(existing.getPath());
                Bitmap thumbnail = extractThumbnail(b,30,30);

                Sample existingFile = new Sample(existing.getName().substring(0,20),thumbnail,
                        existing.getAbsolutePath(), "TODO", "TODO");
                sDataset.add(existingFile);
            }

            return sDataset;
        }

        @Override
        protected void onPostExecute(ArrayList<Sample> result) {
            super.onPostExecute(result);

            ExtendedFloatingActionButton btnSend1 = findViewById(R.id.addSample);
            btnSend1.setVisibility(View.VISIBLE);

            ProgressBar pr = findViewById(R.id.indeterminateBar);
            pr.setVisibility(View.INVISIBLE);

            adapter = new DashboardArrayAdapter(getApplicationContext(),
                    R.layout.dashboard_list_item, result);

            ListView listView = findViewById(R.id.listViewSample);
            listView.setAdapter(adapter);
            listView.setOnItemClickListener(messageClickedHandler);
        }

        private AdapterView.OnItemClickListener messageClickedHandler = new AdapterView.OnItemClickListener() {

            public void onItemClick(AdapterView parent, View v, int position, long id) {

                File directory = getApplicationContext().getFilesDir();
                File[] files = directory.listFiles();

                File existing = files[position];

                Bitmap b = BitmapFactory.decodeFile(existing.getPath());
                Bitmap thumbnail = extractThumbnail(b,30,30);

                Sample sample = new Sample(existing.getName().substring(0,20),thumbnail,
                        existing.getAbsolutePath(), "TODO", "TODO");

                Intent intent = new Intent(getApplicationContext(), InfoActivity.class);
                intent.putExtra("ex", sample);
                startActivity(intent);
            }
        };
    }

    private class TaskTest extends AsyncTask<Boolean,Void,Boolean> {
        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            ProgressBar pr = findViewById(R.id.indeterminateBar);
            pr.setVisibility(View.VISIBLE);

            ExtendedFloatingActionButton btnSend1 = findViewById(R.id.addSample);
            btnSend1.setEnabled(false);

        }

        @Override
        protected Boolean doInBackground(Boolean... booleans) {
            File directory = getApplicationContext().getFilesDir();

            Test test = new Test(directory);
            test.run();

            return null;
        }

        @Override
        protected void onPostExecute(Boolean result) {
            super.onPostExecute(result);

            ExtendedFloatingActionButton btnSend1 = findViewById(R.id.addSample);
            btnSend1.setEnabled(true);

            ProgressBar pr = findViewById(R.id.indeterminateBar);
            pr.setVisibility(View.INVISIBLE);

        }
    }
}
