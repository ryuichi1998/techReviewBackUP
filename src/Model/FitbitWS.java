package Model;

import Utils.ConstantValues;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.security.SecureRandom;
import java.util.ArrayList;

/**
 * Created by liyun on 30/12/16.
 */
@Path("/fitbit")
public class FitbitWS {

    @Context
    private HttpServletRequest request;

    @GET
    public void connect(){
        System.out.println("connect");
        try {
//            URL myURL = new URL("https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=2287JM&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fservices%2Ffitbit%2Fcallback&scope=heartrate&expires_in=604800");
            URL myURL = new URL("https://google.com");
            URLConnection myURLConnection = myURL.openConnection();
            myURLConnection.connect();
            OutputStreamWriter out = new OutputStreamWriter(myURLConnection.getOutputStream());
            System.out.println(myURLConnection.getURL());
        }
        catch (MalformedURLException e) {
            // new URL() failed
            // ...
        }
        catch (IOException e) {
            // openConnection() failed
            // ...
        }
//        HttpClient httpClient = HttpClientBuilder.create().build();
//        HttpPost httpPost = new HttpPost("https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=2287JM&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fservices%2Ffitbit%2Fcallback&scope=heartrate&expires_in=604800");
//        try {
//            httpClient.execute(httpPost);
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
    }

    @GET
    @Path("/callback")
    public void getAccessCode(@QueryParam("code") String code, @Context ServletContext context){
        System.out.println("code la: " + code);

        String accessCode = "";
        ResponseHandler<String> accessTokenHandler, dataHandler;
        String accessTokenBody, dataBody;
        JSONObject accessTokenResponse, dataResponse = null;

        ArrayList<NameValuePair> postParam = new ArrayList<NameValuePair>();

        HttpClient httpClient = HttpClientBuilder.create().build();

        HttpPost httpPost = new HttpPost("https://api.fitbit.com/oauth2/token");
        httpPost.setHeader("Content-Type", "application/x-www-form-urlencoded");
        httpPost.setHeader("Authorization", "Basic MjI4N0pNOjRlNzE0MjBiNmNiOTAwMmZkYWVkYmMwNDhiNWNlODA0");

        postParam.add(new BasicNameValuePair("code", code));
        postParam.add(new BasicNameValuePair("clientId", ConstantValues.CLIENT_ID));
        postParam.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/services/fitbit/callback"));
        postParam.add(new BasicNameValuePair("grant_type", "authorization_code"));

        try {
            httpPost.setEntity(new UrlEncodedFormEntity(postParam));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        try {
            // Execute HTTP Post Request
            accessTokenHandler =new BasicResponseHandler();
            accessTokenBody = httpClient.execute(httpPost, accessTokenHandler);
            accessTokenResponse =new JSONObject(accessTokenBody);
            System.out.println(accessTokenResponse);
            accessCode = accessTokenResponse.getString("access_token");
            System.out.println(accessCode);
        } catch (IOException | JSONException e) {
            e.printStackTrace();
        }

        HttpGet httpGet = new HttpGet("https://api.fitbit.com/1/user/-/activities/heart/date/today/1d.json");
        httpGet.setHeader("Authorization", "Bearer " + accessCode);
        try {
            // Execute HTTP Post Request
            dataHandler =new BasicResponseHandler();
            dataBody = httpClient.execute(httpGet, dataHandler);
            dataResponse =new JSONObject(dataBody);
            System.out.println(dataResponse);
        } catch (IOException | JSONException e) {
            e.printStackTrace();
        }

        HttpSession session;

        session = request.getSession();
        System.out.println("id: "+ session.getAttribute("id"));
        
        context.getRequestDispatcher("/patientDashboard");
    }

//    @POST
//    public String getAccessToken() {
//        String data = null;
//
//        String url = "https://www.fitbit.com/oauth2/authorize?response_type=code&client_id=2287JM&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2FdoctorDashboard&scope=heartrate&expires_in=604800";
//
//        HttpRequestExecutor executor = new HttpUrlConnectionExecutor();
//        OAuth2AuthorizationProvider provider = new BasicOAuth2AuthorizationProvider(URI.create("https://www.fitbit.com/oauth2/authorize"), URI.create("https://api.fitbit.com/oauth2/token"), new Duration(1, 0, 3600));
//
//        OAuth2ClientCredentials credentials = new BasicOAuth2ClientCredentials(ConstantValues.CLIENT_ID, ConstantValues.CLIENT_SECRET);
//
//        OAuth2Client client = new BasicOAuth2Client(provider, credentials, URI.create("http://localhost:8080/doctorDashboard"));
//
//        OAuth2InteractiveGrant grant = new ImplicitGrant(client, new BasicScope("heartrate"));
//
//        URI authorizationUrl = grant.authorizationUrl();
//
//        System.out.println("uri " + authorizationUrl);
//
//        URLConnection con = null;
//        try {
//            con = new URL(authorizationUrl.toString()).openConnection();
//            con.setRequestProperty("Content-Type",
//                    "application/x-www-form-urlencoded");
//            System.out.println("Orignal URL: " + con.getURL());
//            con.connect();
//            System.out.println("Connected URL: " + con.getURL());
//            InputStream is = con.getInputStream();
//            System.out.println("Redirected URL: " + con.getURL());
//            is.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//        try {
//            // Request access token using a Client Credentials Grant
//            OAuth2AccessToken token = new ClientCredentialsGrant(client, new BasicScope("heartrate")).accessToken(executor);
////            OAuth2AccessToken token = grant.withRedirect(URI.create(""))
////            System.out.println("my token " + token.accessToken());
//        } catch (IOException | ProtocolError | ProtocolException | MappableContainerException e) {
//            e.printStackTrace();
//        }

//        return data;
//}

}
