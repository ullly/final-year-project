package com.example.csu44099_fyp_1;

import android.graphics.Color;

public class Pixel {

    private float h;
    private float s;
    private float l;

    private final int rgb;

    private final int[] location;

    public Pixel(int[] location, int pixel) {
        this.location = location;
        this.rgb = pixel;

        RGBtoHSL(pixel);
    }

    public int[] getLocation() {
        return this.location;
    }

    public float getH() {
        return this.h;
    }

    public float getS() {
        return this.s;
    }

    public float getL() {
        return this.l;
    }

    public int getRGB() {
        return this.rgb;
    }

    public String getHSL() {
        String h1 = Float.toString(this.h);
        String s1 = Float.toString(this.s);
        String l1 = Float.toString(this.l);
        String HSL = h1 + "," + s1 + "," + l1;
        return HSL;
    }

    private void RGBtoHSL(int pixel) {

        final float r = Color.red(pixel) / (float)255;
        final float g = Color.green(pixel) / (float)255;
        final float b = Color.blue(pixel) / (float)255;

        final float max = Float.max(Float.max(r,g),b);
        final float min = Float.min(Float.min(r,g),b);

        // Brightness
        l = (max+min)/2;

        if(max == min) {
            s = 0;
            h = -1; // UNDEFINED
        } else {
            float d = max - min;

            // Saturation
            if(l <= 0.5) {
                s = d / (max + min);
            } else {
                s = d / (2-max-min);
            }

            // Hue
            if(r == max) {
                h = (g - b)/d;          // Between yellow and magenta
            } else if(g == max) {
                h = 2 + (b - r)/d;      // Between cyan and yellow
            } else if(b == max) {
                h = 4 + (r - g)/d;      // Between magenta and cyan
            }
            h = 60*h;                   // Convert to degrees
            if(h < 0) {
                h = h + 360;            // Prevent negative values
            }
        }
    }
}
