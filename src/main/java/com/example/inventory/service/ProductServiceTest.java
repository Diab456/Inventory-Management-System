package com.example.inventory.service;

import com.example.inventory.model.Product;
import com.example.inventory.repository.ProductRepository;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class ProductServiceTest {

    @Mock
    private ProductRepository productRepository;

    @InjectMocks
    private ProductService productService;

    public ProductServiceTest() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testGetAllProducts() {
        Product product1 = new Product();
        Product product2 = new Product();
        when(productRepository.findAll()).thenReturn(Arrays.asList(product1, product2));

        List<Product> products = productService.getAllProducts();
        assertEquals(2, products.size());
        verify(productRepository, times(1)).findAll();
    }

    @Test
    public void testGetProductById() {
        Product product = new Product();
        when(productRepository.findById(1L)).thenReturn(Optional.of(product));

        Optional<Product> foundProduct = productService.getProductById(1L);
        assertTrue(foundProduct.isPresent());
        assertEquals(product, foundProduct.get());
        verify(productRepository, times(1)).findById(1L);
    }

    @Test
    public void testAddProduct() {
        Product product = new Product();
        when(productRepository.save(product)).thenReturn(product);

        Product savedProduct = productService.addProduct(product);
        assertEquals(product, savedProduct);
        verify(productRepository, times(1)).save(product);
    }

    @Test
    public void testUpdateProduct() {
        Product product = new Product();
        product.setId(1L);
        when(productRepository.findById(1L)).thenReturn(Optional.of(product));
        when(productRepository.save(product)).thenReturn(product);

        Product updatedProduct = productService.updateProduct(1L, product);
        assertEquals(product, updatedProduct);
        verify(productRepository, times(1)).findById(1L);
        verify(productRepository, times(1)).save(product);
    }

    @Test
    public void testDeleteProduct() {
        Product product = new Product();
        product.setId(1L);

        productService.deleteProduct(1L);
        verify(productRepository, times(1)).deleteById(1L);
    }
}
