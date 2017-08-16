package br.com.loja.online.model;

public enum TipoProduto {

	VESTIDO, SAIA, BLUSA, CAMISETA, JAQUETA, CALÇA, CAMISA;
	
	private String fullState;
	
	
	private TipoProduto(String s) {
		this.fullState = s;
	}
	
	private TipoProduto(){
		
	}

	public String getState() {
		return fullState;
	}
	
}
