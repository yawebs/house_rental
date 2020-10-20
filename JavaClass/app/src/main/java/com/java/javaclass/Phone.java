package com.java.javaclass;

public class Phone {
   private int ram;
   private int memory;
   private int screenSize;
   private String camera;

   public Phone(int ram, int memory,int screenSize, String camera){
       this.ram =ram;
       this.memory =memory;
       this.screenSize = screenSize;
       this.camera =camera;
   }

   public void setRam(int ram){
      this.ram =ram;
   }

   public void setMemory(int memory){
       this.memory = memory;
   }

   public void setScreenSize(int screenSize){
       this.screenSize =screenSize;
   }

   public void setCamera(String camera){
       this.camera=camera;
   }

   public int getRam(){
       return ram;
   }

   public int getMemory(){
       return memory;
   }

   public int getScreenSize(){
       return screenSize;

   }
   public String getCamera(){
       return camera;
   }



}
