package com.java.javaclass;

import java.util.Random;
import java.util.Scanner;

public class TestJava {
    public static void main(String[] args) {
 Scanner scanner = new Scanner(System.in);
        System.out.println("Please Enter Your Name");
        String name = scanner.next();
        while (name==""){
            System.out.println("Please Enter Your Name");
            name = scanner.next();
        }
        System.out.println("Welcome " + name);
        System.out.println("Shall we begin? Yes/No");
        String response = scanner.next();

        while (!response.equals("Yes") && response==""){

            System.out.println("Shall we begin? Yes/No");
           response = scanner.next();
        }

       int randomNumber = new Random().nextInt(20)+1;
        boolean win = false;
        int timestried=0;
        boolean shouldquit = false;

        while (!shouldquit){
            if(timestried>=5){
                shouldquit=true;
            }else {
                timestried++;
                System.out.println("Please guess a number from 1-20");
                int userInput = scanner.nextInt();
                if (userInput== randomNumber){
                    shouldquit=true;
                    win=true;
                }else if (userInput >randomNumber){
                    System.out.println("guess Lower Number");
                }else {
                    System.out.println("guess Higher Number");
                }


            }
        }
        if(win){
            System.out.println("Congrats You Have Won at "+ timestried +" times-tried");
        }else {
            System.out.println("Game-Over at " +timestried +" times-tried");
        }

    }
}
