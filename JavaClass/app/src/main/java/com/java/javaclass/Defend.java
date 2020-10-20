package com.java.javaclass;

import java.util.Random;
import java.util.Scanner;

public class Defend {
    public static void main(String[] args) {
        System.out.println("Guesting game");

        System.out.println("Please enter Your  Name");

        Scanner scanner = new Scanner(System.in);
        String name = scanner.next();
        while (name.equals("")){
            System.out.println("Please Enter Your Name");
            name= scanner.next();
        }

        System.out.println("Welcome "+ name);
        System.out.println("Are You Ready To Play Yes/No");
        String response = scanner.next();

        while (!response.equals("yes")){
            System.out.println("Are You Ready To Play Yes/No");
             response = scanner.next();
        }

        int randomNumber = new Random().nextInt(20)+1;
        boolean win = false;
        int timesTried= 0;
        boolean shouldQuit= false;

        while(!shouldQuit){
            if(timesTried>=5){
                shouldQuit=true;
            }else {
                timesTried++;
                System.out.println("Please gues a Number from 1-20");
                int userInput = scanner.nextInt();
                if (userInput==randomNumber){
                    shouldQuit=true;
                    win=true;

                }else if(userInput>randomNumber) {
                    System.out.println("Guess a Lower Number ");
                }else {
                    System.out.println("Guess Something Higer");
                }

            }
        }
        if(win){
            System.out.println("Congrats You Have won at "+ timesTried+" times-tried");
        }else {
            System.out.println("Game Over! You lost at "+timesTried+" times-tried");
        }
    }
}
