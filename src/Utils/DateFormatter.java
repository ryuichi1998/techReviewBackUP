package Utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by liyun on 11/12/16.
 */
public class DateFormatter {
    private static SimpleDateFormat dateTimeFormat = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
    private static SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy");

    public static int getAge(Date dateOfBirth) {
        int age = 0;
        int currentYear = 0;

        Calendar calendar = Calendar.getInstance();
        currentYear = calendar.get(Calendar.YEAR);

        calendar.setTime(dateOfBirth);
        age = currentYear - calendar.get(Calendar.YEAR);

        return age;
    }

    public static String convertToDisplayDateTime(Date date) {
        String formattedDate = null;

        formattedDate = dateTimeFormat.format(date);

        return formattedDate;
    }

    public static String convertToDisplayDate(Date date) {
        String formattedDate = null;

        formattedDate = dateFormat.format(date);

        return formattedDate;
    }

}
