package cart;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartDTO {
	private int cartId;
	private String cartName;
	private String cartCompanyId;
	private int cartPrice;
	private int cartCount;
	private String cartDetail;
	private String cartImg;
	private int cartSum;
	private String writerId;
	
	public CartDTO() {
	}

	public CartDTO(int cartId, String cartName, String cartCompanyName, int cartPrice, int cartCount, String cartDetail,
			String cartImg, int cartSum, String writerId) {
		super();
		this.cartId = cartId;
		this.cartName = cartName;
		this.cartCompanyId = cartCompanyName;
		this.cartPrice = cartPrice;
		this.cartCount = cartCount;
		this.cartDetail = cartDetail;
		this.cartImg = cartImg;
		this.cartSum = cartSum;
		this.writerId = writerId;
	}

	
}
