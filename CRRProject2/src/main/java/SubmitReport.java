


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import Controller.DAO;

import java.io.IOException;

import Model.Report;

/**
 * Servlet implementation class SubmitReport
 */
@MultipartConfig(fileSizeThreshold=1024*1024*10,
maxFileSize=1024*1024*500,
maxRequestSize=1024*1024*500)

public class SubmitReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public SubmitReport() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		
		int cid=0,status=0;
		
		Report rp=new Report();
		
		DAO dao=new DAO();
		
		rp.setRegion(request.getParameter("Region"));
		rp.setCrimeType(request.getParameter("CrimeType"));
		rp.setDate(request.getParameter("Date"));
		rp.setDescription(request.getParameter("description"));
		
		try {
			cid=dao.insertReport(rp);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		for(Part part:request.getParts())
		{
			
			if(part.getName().equals("Evidence"))
			{
				String type=part.getContentType();
				if(type.equalsIgnoreCase("image/jpeg") || type.equalsIgnoreCase("image/jpg") || type.equalsIgnoreCase("image/png"))
				{
					InputStream p1=part.getInputStream();
					try {
						status=dao.insertImageEvidence(p1,cid);
						//out.println(status);
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(type.equalsIgnoreCase("video/mp4"))
				{
					
					InputStream p1=part.getInputStream();
					
					try {
						status=dao.insertVideoEvidence(p1,cid);
						out.println(status);
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(type.equalsIgnoreCase("application/pdf"))
				{
					
					InputStream p1=part.getInputStream();
					
					try {
						status=dao.insertFileEvidence(p1,cid);
						out.println(status);
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		
		if(status>0)
		{
			response.sendRedirect("FeedBack.jsp");
		}
		else
		{ 
			response.sendRedirect("Error.jsp");
		}
	}

}
