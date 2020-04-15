package com.example.csu44099_fyp_1;

import android.graphics.Bitmap;
import android.os.Parcel;
import android.os.Parcelable;

public class Sample implements Parcelable {
    private String sampleName;
    private Bitmap sampleThumbnail;
    private String sampleLocation;
    private String sampleScore;
    private String samplepH;

    public Sample(String sampleName, Bitmap sampleThumbnail, String sampleLocation,
                  String sampleScore, String samplepH)
    {
        this.sampleName = sampleName;
        this.sampleThumbnail = sampleThumbnail;
        this.sampleLocation = sampleLocation;
        this.sampleScore = sampleScore;
        this.samplepH = samplepH;
    }

    protected Sample(Parcel in) {
        sampleName = in.readString();
        sampleThumbnail = in.readParcelable(Bitmap.class.getClassLoader());
        sampleLocation = in.readString();
        sampleScore = in.readString();
        samplepH = in.readString();
    }

    public static final Creator<Sample> CREATOR = new Creator<Sample>() {
        @Override
        public Sample createFromParcel(Parcel in) {
            return new Sample(in);
        }

        @Override
        public Sample[] newArray(int size) {
            return new Sample[size];
        }
    };

    public String getSampleName()
    {
        return sampleName;
    }
    public Bitmap getSampleThumbnail()
    {
        return sampleThumbnail;
    }
    public String getSampleLocation() {return sampleLocation; }
    public String getSampleScore() {return sampleScore; }
    public String getSamplepH() {return samplepH; }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(sampleName);
        dest.writeParcelable(sampleThumbnail, flags);
        dest.writeString(sampleLocation);
        dest.writeString(sampleScore);
        dest.writeString(samplepH);
    }
}
