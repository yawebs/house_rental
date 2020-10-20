package com.java.ussd;

public class Message {
    private String text;
    private  String reciever;
    private int id;

    public Message(String text, String reciever, int id) {
        this.text = text;
        this.reciever = reciever;
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getReciever() {
        return reciever;
    }

    public void setReciever(String reciever) {
        this.reciever = reciever;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
