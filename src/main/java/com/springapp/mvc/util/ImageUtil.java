package com.springapp.mvc.util;

import java.io.File;

public class ImageUtil {

    public static String[] getListImage(String path) {
        File directory = new File(path);
        File[] fList = directory.listFiles();
        String[] listImage = new String[fList.length];
        for (int i = 0; i < fList.length; i++) {
            if (fList[i].isFile()) {
                listImage[i] = fList[i].getName();
            }
        }
        return listImage;
    }

    public static void removeImage(String path, String image) {
        File imgFile = new File(path + "/" + image);
        if (imgFile.delete()) {
            System.out.println(image + " is deleted!");
        } else {
            System.out.println("Deleting " + image + " is failed.");
        }
    }

}
