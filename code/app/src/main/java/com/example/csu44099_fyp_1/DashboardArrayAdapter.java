package com.example.csu44099_fyp_1;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

public class DashboardArrayAdapter extends ArrayAdapter {
    ArrayList<Sample> sampleList;

    public DashboardArrayAdapter(Context context, int resource, ArrayList<Sample> objects) {
        super(context, resource, objects);
        sampleList = objects;
    }

    @Override
    public int getCount() {
        return super.getCount();
    }

    @Override
    public View getView(int position, View v, ViewGroup parent) {

        LayoutInflater inflater = (LayoutInflater)
                getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        v = inflater.inflate(R.layout.dashboard_list_item, null);
        TextView textView = v.findViewById(R.id.textView);
        TextView textView2 = v.findViewById(R.id.textView2);
        ImageView imageView = v.findViewById(R.id.imageView);

        textView.setText("Sample");
        textView2.setText(sampleList.get(position).getSampleName());
        imageView.setImageBitmap(sampleList.get(position).getSampleThumbnail());

        return v;
    }
}
