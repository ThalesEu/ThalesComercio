/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author Thales Afonso
 */
@Entity
@Table(name = "itemvenda")
@NamedQueries({
    @NamedQuery(name = "Itemvenda.findAll", query = "SELECT i FROM Itemvenda i"),
    @NamedQuery(name = "Itemvenda.findByCodvenda", query = "SELECT i FROM Itemvenda i WHERE i.itemvendaPK.codvenda = :codvenda"),
    @NamedQuery(name = "Itemvenda.findByCodproduto", query = "SELECT i FROM Itemvenda i WHERE i.itemvendaPK.codproduto = :codproduto"),
    @NamedQuery(name = "Itemvenda.findByQuant", query = "SELECT i FROM Itemvenda i WHERE i.quant = :quant"),
    @NamedQuery(name = "Itemvenda.findByPreco", query = "SELECT i FROM Itemvenda i WHERE i.preco = :preco")})
public class Itemvenda implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ItemvendaPK itemvendaPK;
    @Basic(optional = false)
    @Column(name = "quant")
    private int quant;
    @Basic(optional = false)
    @Column(name = "preco")
    private double preco;
    @JoinColumn(name = "codvenda", referencedColumnName = "codigo", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Categoria categoria;
    @JoinColumn(name = "codproduto", referencedColumnName = "codigo", insertable = false, updatable = false)
    @ManyToOne(optional = false)
    private Produto produto;

    public Itemvenda() {
    }

    public Itemvenda(ItemvendaPK itemvendaPK) {
        this.itemvendaPK = itemvendaPK;
    }

    public Itemvenda(ItemvendaPK itemvendaPK, int quant, double preco) {
        this.itemvendaPK = itemvendaPK;
        this.quant = quant;
        this.preco = preco;
    }

    public Itemvenda(int codvenda, int codproduto) {
        this.itemvendaPK = new ItemvendaPK(codvenda, codproduto);
    }

    public ItemvendaPK getItemvendaPK() {
        return itemvendaPK;
    }

    public void setItemvendaPK(ItemvendaPK itemvendaPK) {
        this.itemvendaPK = itemvendaPK;
    }

    public int getQuant() {
        return quant;
    }

    public void setQuant(int quant) {
        this.quant = quant;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (itemvendaPK != null ? itemvendaPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Itemvenda)) {
            return false;
        }
        Itemvenda other = (Itemvenda) object;
        if ((this.itemvendaPK == null && other.itemvendaPK != null) || (this.itemvendaPK != null && !this.itemvendaPK.equals(other.itemvendaPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Itemvenda[ itemvendaPK=" + itemvendaPK + " ]";
    }
    
}
