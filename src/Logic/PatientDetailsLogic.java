package Logic;

import Entity.ConsultationRecord;
import Entity.Medication;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by liyun on 14/12/16.
 */
public class PatientDetailsLogic {

    public PatientDetailsLogic() {

    }

    public List<Medication> getCurrentMedicationList(List<ConsultationRecord> consultationRecordList) {
        List<Medication> currentMedicationList = new ArrayList<Medication>();
        Calendar consultationDate = Calendar.getInstance();
        Calendar todayDate = Calendar.getInstance();
        int quantity;

        for (ConsultationRecord consultationRecord : consultationRecordList) {
            consultationDate.setTime(consultationRecord.getDateTime());
            for (Medication medication : consultationRecord.getMedicationsByConsultationId()) {
                quantity = Integer.parseInt(String.valueOf(medication.getQuantity().charAt(0)));
                Calendar finishedDate = Calendar.getInstance();
                finishedDate.setTime(consultationDate.getTime());
                finishedDate.add(Calendar.MONTH, quantity);
                System.out.println(consultationDate.get(Calendar.MONTH) + " " + finishedDate.get(Calendar.MONTH));
                if (finishedDate.after(todayDate)) {
                    System.out.println("AFTER!" + todayDate.get(Calendar.MONTH));
                    currentMedicationList.add(medication);
                }
            }
        }


        return currentMedicationList;
    }
}
