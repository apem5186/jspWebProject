package cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cart.CartDTO;
import util.DatabaseUtil;

import product.ProductDTO;
import product.ProductDAO;

public class CartDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<CartDTO> ctList(String writerId) {
		ArrayList<CartDTO> ctList = new ArrayList<CartDTO>();
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM cart where writerId = ?");
			pstmt.setString(1, writerId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int cartId = rs.getInt("cartId");
				String cartImg = rs.getString("cartImg");
				String cartName = rs.getString("cartName");
				int cartPrice = rs.getInt("cartPrice");
				int cartCount = rs.getInt("cartCount");
				int cartSum = rs.getInt("cartSum");
				//String writerId = rs.getString("writerId");
				
				CartDTO data = new CartDTO();
				data.setCartId(cartId);
				data.setCartImg(cartImg);
				data.setCartName(cartName);
				data.setCartPrice(cartPrice);
				data.setCartCount(cartCount);
				data.setCartSum(cartSum);
				data.setWriterId(writerId);
				ctList.add(data);
			}
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.println("cartDAO ctList Error");
			e.printStackTrace();
		}
		return ctList;
	}

	public int insertCart(ProductDTO productDTO) {
	      String SQL = "INSERT INTO cart (cartId, cartName, cartPrice, cartCount, cartImg, writerId)"
	    		  + "VALUES (?, ?, ?, ?, ?, ?)";
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	            conn = DatabaseUtil.getConnection();
	            pstmt = conn.prepareStatement(SQL);
	
				pstmt.setInt(1, productDTO.getProductId());
				pstmt.setString(2, productDTO.getProductName());
				pstmt.setInt(3, productDTO.getPrice());
				pstmt.setInt(4, productDTO.getSoldCount());
				pstmt.setString(5, productDTO.getImgUrl_1());
				pstmt.setString(6, productDTO.getWriterId());
				
	            return pstmt.executeUpdate();
	      } catch (Exception e){
	         System.out.println("insertCart Error" + e);
	      } finally {
	         try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
	         try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
	         try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
	      }
	      return -1;   // 데이터베이스 오류
	   }
	
	
	public CartDTO getCart(String writerId) {
		CartDTO ctDto = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement("SELECT * FROM cart where writerId = ?");
			pstmt.setString(1, writerId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ctDto = new CartDTO();
				ctDto.setCartId(rs.getInt("cartId"));
				ctDto.setCartImg(rs.getString("cartImg"));
				ctDto.setCartName(rs.getString("cartName"));
				ctDto.setCartPrice(rs.getInt("cartPrice"));
				ctDto.setCartCount(rs.getInt("cartCount"));
				ctDto.setCartSum(rs.getInt("cartSum"));
				ctDto.setWriterId(rs.getString("writerId"));
				
			}		
		} catch (Exception e) {
			System.out.println("getCartError" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return ctDto;
	}
	
	public boolean deleteCart(String cartId, String writerId) {
		boolean b = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "DELETE FROM cart WHERE cartId = ? AND writerId = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, cartId);
			pstmt.setString(2, writerId);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteCart Error" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return b;
	}
	
	public boolean deleteCartAll(String writerId) {
		boolean b = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			String SQL = "DELETE FROM cart WHERE writerId = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, writerId);
			if(pstmt.executeUpdate() > 0) b = true;
		} catch (Exception e) {
			System.out.println("deleteCart Error" + e);
		} finally {
			try { if(conn != null) conn.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) {e.printStackTrace();}
			try { if(rs != null) rs.close(); } catch (Exception e) {e.printStackTrace();}
		}
		return b;
	}
}