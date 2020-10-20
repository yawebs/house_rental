package com.java.javaclass;


import java.util.Scanner;

public class Array {
    public static void main(String[] args) {

  Phone samsung = new Phone(4,64,47,"20mp");

        System.out.println("ram: "+samsung.getRam());
        samsung.setRam(8);
        System.out.println("Ram is now "+ samsung.getRam());
        System.out.println("Camera :"+samsung.getCamera());
    }
}
