package product;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductDTO {
	private int productId;
	private String productName;
	private int companyId;
	private int price;
	private int soldCount;
	private String detail;
	private String imgUrl_1;
	private String writerId;
	
	public ProductDTO() {
	}
	
	public ProductDTO(int productId, String productName, int companyId, int price, int soldCount,
			String detail, String imgUrl_1, String writerId) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.companyId = companyId;
		this.price = price;
		this.soldCount = soldCount;
		this.detail = detail;
		this.imgUrl_1 = imgUrl_1;
		this.writerId = writerId;
	}
}
