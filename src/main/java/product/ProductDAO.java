package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import product.ProductDTO;
import util.DatabaseUtil;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ProductDTO> pdList() {
		ArrayList<ProductDTO> pdList = new ArrayList<ProductDTO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM product");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int productId = rs.getInt("productId");
				String productName = rs.getString("productName");
				int companyId = rs.getInt("companyId");
				int price = rs.getInt("price");
				int soldCount = rs.getInt("soldCount");
				String detail = rs.getString("detail");
				String imgUrl_1 = rs.getString("imgUrl_1");
				String writerId = rs.getString("writerId");
				
				ProductDTO data = new ProductDTO();
				data.setProductId(productId);
				data.setProductName(productName);
				data.setCompanyId(companyId);
				data.setPrice(price);
				data.setSoldCount(soldCount);
				data.setDetail(detail);
				data.setImgUrl_1(imgUrl_1);
				data.setWriterId(writerId);
				pdList.add(data);
			}
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("productDAO pdList Error");
			e.printStackTrace();
		}
		return pdList;
	}
	
	
	public ProductDTO getProduct(String productId) {
		ProductDTO pdDto = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM product where productId = ?");
			pstmt.setInt(1, Integer.parseInt(productId));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pdDto = new ProductDTO();
				pdDto.setProductId(rs.getInt("productId"));
				pdDto.setProductName(rs.getString("productName"));
				pdDto.setCompanyId(rs.getInt("companyId"));
				pdDto.setPrice(rs.getInt("price"));
				pdDto.setSoldCount(rs.getInt("soldCount"));
				pdDto.setDetail(rs.getString("detail"));
				pdDto.setImgUrl_1(rs.getString("imgUrl_1"));
				pdDto.setWriterId(rs.getString("writerId"));
				
			}		
		} catch (Exception e) {
			System.out.println("getProductError" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return pdDto;
	}
	
	public int insertProduct(ProductDTO productDTO) {
		String SQL = "INSERT INTO product VALUES (NULL, ?, ?, ?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
				conn = DatabaseUtil.getConnection();
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, productDTO.getProductName().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
				pstmt.setInt(2, productDTO.getCompanyId());
				pstmt.setInt(3, productDTO.getPrice());
				pstmt.setInt(4, productDTO.getSoldCount());
				pstmt.setString(5, productDTO.getDetail().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
				pstmt.setString(6, productDTO.getImgUrl_1().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
				pstmt.setString(7, productDTO.getWriterId().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
				return pstmt.executeUpdate();
		} catch (Exception e){
			System.out.println("insertProduct Error" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return -1;	// 데이터베이스 오류
	}
	
	public boolean updateProduct(HttpServletRequest request) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean b = false;
		try {
			//업로드할 이미지 경로(절대 경로)
			String uploadDir = "C:\\Users\\apem5\\git\\jspWeb\\JspWeb\\WebContent\\images";
			 //MultipartRequest multi=new MultipartRequest(request, savePath, sizeLimit, new DefaultFileRenamePolicy());
            MultipartRequest multi = new MultipartRequest(request, uploadDir, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
            conn = DatabaseUtil.getConnection();
            
            if (multi.getFilesystemName("img_Url_1") == null) {
            	String SQL = "UPDATE product SET productName=?, companyId=?, price=?, soldCount=?, detail=? writerId=? where productId=?";
            	pstmt = conn.prepareStatement(SQL);
            	//pstmt.setInt(1, Integer.parseInt(multi.getParameter("productId")));
            	pstmt.setString(1, multi.getParameter("productName"));
            	pstmt.setString(2, multi.getParameter("companyId"));
            	pstmt.setString(3, multi.getParameter("price"));
            	pstmt.setString(4, multi.getParameter("soldCount"));
            	pstmt.setString(5, multi.getParameter("detail"));
            	pstmt.setString(6, multi.getParameter("writerId"));
            } else {
            	String SQL = "UPDATE product SET productName=?, companyId=?, price=?, soldCount=?, detail=?, imgUrl_1=? writerId=? where productId=?";
            	pstmt = conn.prepareStatement(SQL);
            	//pstmt.setInt(1, Integer.parseInt(multi.getParameter("productId")));
            	pstmt.setString(1, multi.getParameter("productName"));
            	pstmt.setString(2, multi.getParameter("companyId"));
            	pstmt.setString(3, multi.getParameter("price"));
            	pstmt.setString(4, multi.getParameter("soldCount"));
            	pstmt.setString(5, multi.getParameter("detail"));
            	pstmt.setString(6, multi.getFilesystemName("imgUrl_1"));
            	pstmt.setString(7, multi.getParameter("writerId"));
            }
            if (pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e){
			System.out.println("updateProduct Error" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return b;
	}
	
	public boolean deleteProduct(String productId) {
		boolean b = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "DELETE FROM product WHERE productId = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt("productId"));
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteProduct Error" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return b;
	}
}
