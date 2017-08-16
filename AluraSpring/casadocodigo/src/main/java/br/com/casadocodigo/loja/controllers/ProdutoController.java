package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.persistence.NoResultException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.infra.FileSaver;
import br.com.casadocodigo.loja.model.Produto;
import br.com.casadocodigo.loja.model.TipoPreco;
import br.com.casadocodigo.loja.validator.ProdutoValidator;

@Controller
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	private ProdutoDAO produtoDAO;
	@Autowired
	private FileSaver saver;
	
	@RequestMapping("/form")
	public ModelAndView form(Produto prod){
		
		ModelAndView modelAndView = new ModelAndView("produto/form");
		modelAndView.addObject("tipos", TipoPreco.values());
		
		return modelAndView;
	}
	
 

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new ProdutoValidator());
	}
	
	@CacheEvict(value="produtoHome",allEntries=true)
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(MultipartFile sumario, @Valid Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			return form(produto);
		}
		
		String sumarioPath = saver.write("arquivos-sumario", sumario);

        produto.setSumarioPath(sumarioPath);
		System.out.println(produto.getSumarioPath());
		produtoDAO.gravar(produto);
		
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso!");
		
		return new ModelAndView("redirect:produto");
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar() {
		List<Produto> produtos = produtoDAO.listar();
		ModelAndView modelAndView = new ModelAndView("produto/lista");
		modelAndView.addObject("produto", produtos);

		return modelAndView;
		
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("produto/detalhe");
		Produto produto = produtoDAO.find(id);
		modelAndView.addObject("produto", produto);
		
		return modelAndView;
	}
	

	
	
}
