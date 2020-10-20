package com.java.ussd;

import java.util.ArrayList;

public class Contact {
    private  String name;
    private String email;
    private int number;
    private ArrayList<Message>message;

    public Contact(String name, String email, int number, ArrayList<Message> message) {
        this.name = name;
        this.email = email;
        this.number = number;
        this.message = message;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public ArrayList<Message> getMessage() {
        return message;
    }

    public void setMessage(ArrayList<Message> message) {
        this.message = message;
    }

   public void showContactDetails(){
       System.out.println("Name: "+ getName());
       System.out.println("Email: "+ getEmail());
       System.out.println("Number: "+ getNumber());
   }
}
