package com.gegero.myapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView textView = findViewById(R.id.textView);
        Button button = findViewById(R.id.button);
    }

    public void onButtonClick(View view){
        TextView textView = findViewById(R.id.textView);
        Button button = findViewById(R.id.button);
       // textView.setText("Hello Christian");

        EditText editText = findViewById(R.id.editText);
        textView.setText(editText.getText().toString());

    }
}
