package Logic;

import Entity.VitalSigns;
import Utils.ConstantValues;

import java.util.ArrayList;
import java.util.List;

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

        double heartBeatTotal = 0;
        double glucoseLevelTotal = 0;
        double bloodPressureTotal = 0;

        double heartBeatFreq = 0;
        double glucoseLevelFreq = 0;
        double bloodPressureFreq = 0;

        double heartBeatAvg = 0;
        double glucoseLevelAvg = 0;
        double bloodPressureAvg = 0;

        for (VitalSigns vitalSigns : vitalSignsList) {

            if (vitalSigns.getType().equalsIgnoreCase(ConstantValues.HEART_BEAT_TYPE)) {
                heartBeatFreq++;
                heartBeatTotal += vitalSigns.getData();
            } else if (vitalSigns.getType().equalsIgnoreCase(ConstantValues.BLOOD_PRESSURE_TYPE)) {
                bloodPressureFreq++;
                System.out.println("times  " + bloodPressureFreq);
                bloodPressureTotal += vitalSigns.getData();
            } else {
                glucoseLevelFreq++;
                glucoseLevelTotal += vitalSigns.getData();
            }
        }

        try {
            heartBeatAvg = heartBeatTotal/heartBeatFreq;
            bloodPressureAvg = bloodPressureTotal/bloodPressureFreq;
            glucoseLevelAvg = glucoseLevelTotal/glucoseLevelFreq;
            System.out.println("heart " + heartBeatAvg);
            System.out.println("heart " + bloodPressureAvg);
            System.out.println("heart " + glucoseLevelAvg);
        } catch (Exception e) {
            e.printStackTrace();
        }

        avgHeartBeatVitalSign.setType(ConstantValues.HEART_BEAT_TYPE);
        avgHeartBeatVitalSign.setData(heartBeatAvg);

        avgBloodPressureVitalSign.setType(ConstantValues.BLOOD_PRESSURE_TYPE);
        avgBloodPressureVitalSign.setData(bloodPressureAvg);

        avgGlucoseLevelVitalSign.setType(ConstantValues.GLUCOSE_LEVEL_TYPE);
        avgGlucoseLevelVitalSign.setData(glucoseLevelAvg);

        avgVitalSignsList.add(avgHeartBeatVitalSign);
        avgVitalSignsList.add(avgBloodPressureVitalSign);
        avgVitalSignsList.add(avgGlucoseLevelVitalSign);

        return avgVitalSignsList;
    }

}
