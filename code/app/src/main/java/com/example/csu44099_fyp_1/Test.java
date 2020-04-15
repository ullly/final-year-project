package com.example.csu44099_fyp_1;

import android.graphics.Bitmap;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Test {

    private final String TITLE = "ANALYSIS-2-";
    private final File directory;

    public Test(File directory) {
        this.directory = directory;
    }

    public Boolean run() {

        File[] files = directory.listFiles();
        for (int i = 0; i < files.length; i++) {

            // Get image
            File existing = files[i];
            Image image = new Image(existing.getPath());

            // --- Test code goes here ---


            // Save image
            save(existing, image);
        }
        return true;
    }

    private void save(File existing, Image image) {

        String name = existing.getName().substring(0,20);

        File imageFile = createTempImageFile(TITLE + name + "_");
        try {
            FileOutputStream o = new FileOutputStream(imageFile);

            image.getImage().compress(Bitmap.CompressFormat.JPEG, 100, o);

            o.flush();
            o.close();

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private File createTempImageFile(String fileName) {
        File imageFile;

        try {
            imageFile = File.createTempFile(fileName,".jpg",directory);
            return imageFile;
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
