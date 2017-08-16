package br.com.loja.online.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.loja.online.dao.ProdutoDAO;
import br.com.loja.online.model.Produto;
import br.com.loja.online.model.TipoProduto;

@Controller
@RequestMapping("/produto")
public class ProdutoController {

	@Autowired
	private ProdutoDAO produtoDao;
	
	@RequestMapping("/form")
	public ModelAndView form(Produto produto) {
		List<TipoProduto> stateList = new ArrayList<TipoProduto>(Arrays.asList(TipoProduto.values()));
		ModelAndView modelAndView = new ModelAndView("produto/form");
		
		modelAndView.addObject("stateList", stateList);
		modelAndView.addObject("tipos", TipoProduto.values());
		
		
		return modelAndView;
	}

	public ModelAndView gravar(Produto produto, BindingResult result, RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			return form(produto);
		}
		
		produtoDao.gravar(produto);
		
		redirectAttributes.addFlashAttribute("sucesso", "Produto cadastrado com sucesso!");
		
		return new ModelAndView("redirect:produto");
		
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView listar() {
		List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("produto/lista");
		modelAndView.addObject("produto", produtos);
		
		return modelAndView;
	}
	
	@RequestMapping("/detalhe/{id}")
	public ModelAndView detalhe(@PathVariable("id") Integer id) {
		ModelAndView modelAndView = new ModelAndView("produto/detalhe");
		Produto produto = produtoDao.find(id);
		modelAndView.addObject("produto", produto);
		
		return modelAndView;
	}
	
	
}
