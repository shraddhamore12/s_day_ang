import { Component, OnInit } from '@angular/core';
import { ProductService } from '../product.service';
import { Router } from '@angular/router'

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {
  products;

  constructor(private service: ProductService,
    public router:Router) { }

  ngOnInit() {

    this.service
    .getproducts()
    .subscribe(response =>{
      this.products = response;
    })
  }

}
