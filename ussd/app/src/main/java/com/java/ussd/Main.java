package com.java.ussd;

import java.util.ArrayList;
import java.util.Scanner;
public class Main {
    private static Scanner scanner;
    private static ArrayList<Contact>contacts;
    public static void main(String[] args) {
        scanner= new Scanner(System.in);
        contacts= new ArrayList<>();
        initPage();
    }

  public static void initPage(){
      System.out.println("Choose Action \n"+
             "\t1. Manage Contacts\n"+
              "\t2.Send Message \n" +
              "\t3. Quit");
      int userChoice = scanner.nextInt();
      switch (userChoice){
          case 1:
              manageContacts();
              break;

          case 2:

              break;

          case 3:

              break;

              default:
                  break;
      }
  }
   public static void manageContacts(){
       System.out.println("Choose From Options\n" +
               "\t1. Add A Contact \n" +
               "\t2. Show All Contacts\n" +
               "\t3. Remove A Contact\n" +
               "\t4. Search a Contact\n"+
               "\t5. Go back");
       int userChoose = scanner.nextInt();

       switch (userChoose){
           case 1:
               addNewContact();
               break;

           case 2:
               showAllContacts();
               break;

           case 3:removeContact();
               break;

           case 4:
               break;

           case 5:

               break;

               default:
                   break;
       }
   }

   public static void addNewContact(){
       System.out.print("Enter Contact Name\n");
       String newName= scanner.next().trim();

       System.out.println("Enter Email\n");
       String newEmail =scanner.next().trim();

       System.out.println("Enter Number");
       int newNumber =scanner.nextInt();

       Contact newContact =new Contact(newName,newEmail,newNumber,null);
       contacts.add(newContact);
       System.out.println(newName +" "+ newEmail+" " +newNumber +" Successfully Added\n");
       System.out.println("***************************");
       initPage();


   }

   public static void showAllContacts(){
        if(contacts.size()>0){
            for (int i=0; i<contacts.size(); i++){
                contacts.get(i).showContactDetails();

            }

        }else{

            System.out.println("There is currently no contacts to display");
            initPage();
        }
   }
      public static void removeContact(){
        if(contacts.size() > 0){
            System.out.print("Enter The Name To Remove :");
            String nameToRemove = scanner.next();

            if(!(nameToRemove.equals(""))){
                for(int i = 0;i < contacts.size();i++){
                    if(nameToRemove.equals(contacts.get(i).getName())){
                        System.out.print("Are You Sure You want to remove " + contacts.get(i).getName());
                        System.out.println("Enter 0 to remove/1 not to :");
                        int remove = scanner.nextInt();
                        if((remove == 0)){
                            contacts.remove(i);
                            System.out.println(nameToRemove +" Successfully Removed");
                            manageContacts();
                        }else {
                            initPage();
                        }

                    }
                }
            }else{
                initPage();
            }
        }else{
            System.out.println("There is currently no contacts to display");
            initPage();
        }
      }
}
