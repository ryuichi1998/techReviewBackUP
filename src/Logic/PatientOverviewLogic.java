package Logic;

import Entity.VitalSigns;
import Utils.ConstantValues;

import java.util.ArrayList;
import java.util.DoubleSummaryStatistics;
import java.util.List;
import java.util.Scanner;

/**
 * Created by liyun on 13/12/16.
 */
public class PatientOverviewLogic {

    public PatientOverviewLogic() {
    }

    public List<VitalSigns> getAverageVitalSignByPatientVitalSignList(List<VitalSigns> vitalSignsList) {
        List<VitalSigns> avgVitalSignsList = new ArrayList<VitalSigns>();

        VitalSigns avgHeartBeatVitalSign = new VitalSigns();
        VitalSigns avgBloodPressureVitalSign = new VitalSigns();
        VitalSigns avgGlucoseLevelVitalSign = new VitalSigns();

        String[] dateBP;

        double heartBeatTotal = 0;
        double glucoseLevelTotal = 0;
        double bloodPressureSTotal = 0;
        double bloodPressureDTotal = 0;

        double heartBeatFreq = 0;
        double glucoseLevelFreq = 0;
        double bloodPressureFreq = 0;

        double heartBeatAvg = 0;
        double glucoseLevelAvg = 0;
        double bloodPressureSAvg = 0;
        double bloodPressureDAvg = 0;

        for (VitalSigns vitalSigns : vitalSignsList) {

            if (vitalSigns.getType().equalsIgnoreCase(ConstantValues.HEART_BEAT_TYPE)) {
                heartBeatFreq++;
                heartBeatTotal += convertToDoubleFromString(vitalSigns.getData());
            } else if (vitalSigns.getType().equalsIgnoreCase(ConstantValues.BLOOD_PRESSURE_TYPE)) {
                dateBP = vitalSigns.getData().split("/");

                bloodPressureFreq++;
                bloodPressureSTotal += convertToDoubleFromString(dateBP[0]);
                bloodPressureDTotal += convertToDoubleFromString(dateBP[1]);
            } else {
                glucoseLevelFreq++;
                glucoseLevelTotal += convertToDoubleFromString(vitalSigns.getData());
            }
        }

        try {
            heartBeatAvg = heartBeatTotal/heartBeatFreq;
            bloodPressureSAvg = bloodPressureSTotal/bloodPressureFreq;
            bloodPressureDAvg = bloodPressureDTotal/bloodPressureFreq;
            glucoseLevelAvg = glucoseLevelTotal/glucoseLevelFreq;
            System.out.println("heart " + heartBeatAvg);
            System.out.println("heart " + bloodPressureSAvg);
            System.out.println("heart " + bloodPressureDAvg);
            System.out.println("heart " + glucoseLevelAvg);
        } catch (Exception e) {
            e.printStackTrace();
        }

        avgHeartBeatVitalSign.setType(ConstantValues.HEART_BEAT_TYPE);
        avgHeartBeatVitalSign.setData(convertToStringFromDouble(heartBeatAvg));

        avgBloodPressureVitalSign.setType(ConstantValues.BLOOD_PRESSURE_TYPE);
        avgBloodPressureVitalSign.setData(convertToStringFromDouble(bloodPressureSAvg) + "/" + convertToStringFromDouble(bloodPressureDAvg));

        avgGlucoseLevelVitalSign.setType(ConstantValues.GLUCOSE_LEVEL_TYPE);
        avgGlucoseLevelVitalSign.setData(convertToStringFromDouble(glucoseLevelAvg));

        avgVitalSignsList.add(avgHeartBeatVitalSign);
        avgVitalSignsList.add(avgBloodPressureVitalSign);
        avgVitalSignsList.add(avgGlucoseLevelVitalSign);

        return avgVitalSignsList;
    }

    private Double convertToDoubleFromString(String str){
        Double d = 0.0;

        try {
            d = Double.parseDouble(str);
        }catch (NumberFormatException e){
            e.printStackTrace();
        }

        return d;
    }

    private String convertToStringFromDouble(Double d){
        String str = "";

        try {
            str = String.valueOf(d);
        }catch (Exception e){
            e.printStackTrace();
        }

        return str;
    }
}
