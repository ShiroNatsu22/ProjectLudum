package controller;

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;


@WebServlet("/controller/FileUpload")
@MultipartConfig
public class FileUpload extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Part userProfileImage = req.getPart("userProfileImage");

        if (userProfileImage != null) {
            String fileName = Paths.get(userProfileImage.getSubmittedFileName()).getFileName().toString();
            String name = fileName.substring(0, fileName.lastIndexOf("."));
            String ext = fileName.substring(fileName.lastIndexOf("."));

            File uploads = new File(getServletContext().getInitParameter("UserProfileImageFolder"));
            uploads.mkdirs();

            File file = File.createTempFile(name, ext, uploads);

            try (InputStream inputStream = userProfileImage.getInputStream()) {
                Files.copy(inputStream, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            String json = new Gson().toJson(file.getName());
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(json);
        }

    }
}
