package com.example.csu44099_fyp_1;

import android.graphics.Color;

public class Histogram {
    private int histogram[];

    // Creates a histogram for a greyscale image
    public Histogram(Image image) {
        histogram = new int[256];
        for(int i = 0; i < image.getWidth(); i++) {
            for (int j = 0; j < image.getHeight(); j++) {
                histogram[Color.green(image.getPixel(i,j))]++;
            }
        }
    }

    public void smooth() {
        for(int i = 1; i < histogram.length-1; i++) {
            histogram[i] = (histogram[i-1] + histogram[i] + histogram[i+1]) / 3;
        }
    }

    // Bimodal histogram thresholding.
    public int threshold(Image image) {
        int max = getMax(); // Find most populated bin

        // Move left until a valley is found
        int t = max-1;
        while(t >= 0 && histogram[t] <= histogram[max]) {
            max = t;
            t--;
        }
        t++;

        // Set left of the valley black. Set right of the valley white
        for(int i = 0; i < image.getWidth(); i++) {
            for(int j = 0; j < image.getHeight(); j++) {
                if(Color.green(image.getPixel(i,j)) >= t) {
                    image.setPixel(i,j,0xFFFFFFFF);
                } else {
                    image.setPixel(i,j,0xFF000000);
                }
            }
        }
        return max;
    }

    // Returns the most populated bin of the histogram
    private int getMax() {
        int max = histogram[0];
        int maxIndex = 0;
        int i = 1;
        while(i < histogram.length) {
            if(histogram[i] >= max) {
                max = histogram[i];
                maxIndex = i;
            }
            i++;
        }
        return maxIndex;
    }
}
