package br.com.casadocodigo.loja.controllers;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.model.CarrinhoCompras;
import br.com.casadocodigo.loja.model.DadosPagamento;
import br.com.casadocodigo.loja.model.Usuario;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {

	@Autowired
	private CarrinhoCompras carrinho;
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private MailSender sender;
	
	@RequestMapping(value="/finalizar", method=RequestMethod.POST)
	public Callable<ModelAndView> finalizar(@AuthenticationPrincipal  Usuario usuario, RedirectAttributes model) {
		
		return() -> {
			
			String uri = "http://book-payment.herokuapp.com/payment";
			
		

		try{
			
			String response = restTemplate.postForObject(uri, new DadosPagamento(carrinho.getTotal()), String.class);
			
			System.out.println(response);
			
			enviaEmailCompraProduto(usuario);
			
			model.addFlashAttribute("sucesso", response);
			
			return new ModelAndView("redirect:/produto");
			
		} catch(HttpClientErrorException e) {
			e.printStackTrace();
			
			model.addFlashAttribute("falha", "Valor maior que o permitido");

			return new ModelAndView("redirect:/produto");
		}
		
		};
	}

	private void enviaEmailCompraProduto(Usuario usuario) {
		
		SimpleMailMessage email = new SimpleMailMessage();
		email.setSubject("Compra finalizada com sucesso!");
		email.setTo("felipebentobritto@gmail.com");
		email.setText("PEEEEEEEEEEW, Compra aprovada com sucesso no valor de " + carrinho.getTotal());
		email.setFrom("felipebentobritto@gmail.com");
		
		sender.send(email);
		
	}
	
}
