package com.example.csu44099_fyp_1;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;

import java.io.File;

public class Image {
    private Bitmap image;

    private final int width = 600;
    private final int height = 800;

    public Image(String path) {
        Bitmap image1;
        File file = new File(path);

        BitmapFactory.Options o = new BitmapFactory.Options();
        image1 = BitmapFactory.decodeFile(file.getAbsolutePath(),o);

        // Creates a scaled image using bilinear interpolation
        image1 = Bitmap.createScaledBitmap(image1,this.width,this.height,true);

        this.image = image1;
    }

    public int getPixel(int x, int y) {
        return this.image.getPixel(x,y);
    }

    public void setPixel(int x, int y, int colour) {
        this.image.setPixel(x,y,colour);
    }

    public Bitmap getImage() {
        return this.image;
    }

    public int getWidth() {
        return this.image.getWidth();
    }

    public int getHeight() {
        return this.image.getHeight();
    }

    public void setHeight(int x, int y, int h) {
        this.image = this.image.createBitmap(this.image,x,y,this.width,h);
    }

    public void toGreyscale() {
        for(int i = 0; i < this.image.getWidth(); i++) {
            for(int j = 0; j < this.image.getHeight(); j++) {

                final int pixel = getPixel(i,j);

                int a = Color.alpha(pixel);
                int r = Color.red(pixel);
                int g = Color.green(pixel);
                int b = Color.blue(pixel);

                final int max = Integer.max(Integer.max(r,g),b);
                final int min = Integer.min(Integer.min(r,g),b);
                final int LIGHTNESS = (max+min)/2;

                a = a;
                r = LIGHTNESS;
                g = LIGHTNESS;
                b = LIGHTNESS;

                int c = (a & 0xff) << 24 | (r & 0xff) << 16 | (g & 0xff) << 8 | (b & 0xff);

                setPixel(i,j,c);
            }
        }
    }
}
