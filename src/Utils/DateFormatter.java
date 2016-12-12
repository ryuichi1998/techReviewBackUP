package Utils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by liyun on 11/12/16.
 */
public class DateFormatter {

    public static int getAge(Date dateOfBirth){
        int age = 0;
        int currentYear = 0;

        Calendar calendar = Calendar.getInstance();
        currentYear = calendar.get(Calendar.YEAR);

        calendar.setTime(dateOfBirth);
        age = currentYear - calendar.get(Calendar.YEAR);

        return age;
    }

}
