package com.java.layoutstutorial;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    private EditText fname,lname,email;
    private TextView textView_fname, textView_lname,textView_email, textView_gender;
    private Button btnSubmit;
    private String user_fname, user_lname,user_email;
    private RadioGroup radioGroup;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

  fname= findViewById(R.id.fname);
  lname = findViewById(R.id.lname);
  email= findViewById(R.id.email);
  textView_fname = findViewById(R.id.textview_firstname);
  textView_lname = findViewById(R.id.textview_lastname);
  textView_email= findViewById(R.id.textview_email);
  textView_gender = findViewById(R.id.textview_gender);
  btnSubmit = findViewById(R.id.btn_submit);
  radioGroup = findViewById(R.id.radio_group);

  btnSubmit.setOnClickListener(new View.OnClickListener() {
      @Override
      public void onClick(View v) {
         user_fname = fname.getText().toString();
         user_lname = lname.getText().toString();
         user_email = email.getText().toString();


         int radioButtonId = radioGroup.getCheckedRadioButtonId();

         switch (radioButtonId){

             case R.id.g_female:
                 textView_gender.setText("Female");
                 break;

             case R.id.g_male:
                 textView_gender.setText("Male");
                 break;

             case R.id.g_others:
                 textView_gender.setText("Others");
                 break;
         }


         textView_fname.setText(user_fname);
         textView_lname.setText(user_lname);
         textView_email.setText(user_email);
      }
  });
    }
}
