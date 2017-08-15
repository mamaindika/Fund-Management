package model;
// Generated Nov 18, 2016 10:56:04 AM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TblInvestments generated by hbm2java
 */
@Entity
@Table(name="tbl_investments"
    ,catalog="fund_manager"
)
public class TblInvestments  implements java.io.Serializable {


     private Integer id;
     private TblAccountJournalmapping tblAccountJournalmapping;
     private TblFundtypes tblFundtypes;
     private TblInvestmenttypes tblInvestmenttypes;
     private Integer referenceNo;
     private Integer receiptNo;
     private String investDate;
     private String matureDate;
     private Integer noOfDays;
     private BigDecimal amount;
     private Integer taxRate;
     private String taxValue;
     private Integer interestRate;
     private BigDecimal interestValue;
     private Integer interestAt;
     private BigDecimal interest;
     private String status;

    public TblInvestments() {
    }

    public TblInvestments(TblAccountJournalmapping tblAccountJournalmapping, TblFundtypes tblFundtypes, TblInvestmenttypes tblInvestmenttypes, Integer referenceNo, Integer receiptNo, String investDate, String matureDate, Integer noOfDays, BigDecimal amount, Integer taxRate, String taxValue, Integer interestRate, BigDecimal interestValue, Integer interestAt, BigDecimal interest, String status) {
       this.tblAccountJournalmapping = tblAccountJournalmapping;
       this.tblFundtypes = tblFundtypes;
       this.tblInvestmenttypes = tblInvestmenttypes;
       this.referenceNo = referenceNo;
       this.receiptNo = receiptNo;
       this.investDate = investDate;
       this.matureDate = matureDate;
       this.noOfDays = noOfDays;
       this.amount = amount;
       this.taxRate = taxRate;
       this.taxValue = taxValue;
       this.interestRate = interestRate;
       this.interestValue = interestValue;
       this.interestAt = interestAt;
       this.interest = interest;
       this.status = status;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="journalNo")
    public TblAccountJournalmapping getTblAccountJournalmapping() {
        return this.tblAccountJournalmapping;
    }
    
    public void setTblAccountJournalmapping(TblAccountJournalmapping tblAccountJournalmapping) {
        this.tblAccountJournalmapping = tblAccountJournalmapping;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="fundId")
    public TblFundtypes getTblFundtypes() {
        return this.tblFundtypes;
    }
    
    public void setTblFundtypes(TblFundtypes tblFundtypes) {
        this.tblFundtypes = tblFundtypes;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="InvestmentTypeId")
    public TblInvestmenttypes getTblInvestmenttypes() {
        return this.tblInvestmenttypes;
    }
    
    public void setTblInvestmenttypes(TblInvestmenttypes tblInvestmenttypes) {
        this.tblInvestmenttypes = tblInvestmenttypes;
    }

    
    @Column(name="referenceNo")
    public Integer getReferenceNo() {
        return this.referenceNo;
    }
    
    public void setReferenceNo(Integer referenceNo) {
        this.referenceNo = referenceNo;
    }

    
    @Column(name="ReceiptNo")
    public Integer getReceiptNo() {
        return this.receiptNo;
    }
    
    public void setReceiptNo(Integer receiptNo) {
        this.receiptNo = receiptNo;
    }

    
    @Column(name="InvestDate", length=100)
    public String getInvestDate() {
        return this.investDate;
    }
    
    public void setInvestDate(String investDate) {
        this.investDate = investDate;
    }

    
    @Column(name="MatureDate", length=100)
    public String getMatureDate() {
        return this.matureDate;
    }
    
    public void setMatureDate(String matureDate) {
        this.matureDate = matureDate;
    }

    
    @Column(name="NoOfDays")
    public Integer getNoOfDays() {
        return this.noOfDays;
    }
    
    public void setNoOfDays(Integer noOfDays) {
        this.noOfDays = noOfDays;
    }

    
    @Column(name="Amount", precision=13)
    public BigDecimal getAmount() {
        return this.amount;
    }
    
    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    
    @Column(name="TaxRate")
    public Integer getTaxRate() {
        return this.taxRate;
    }
    
    public void setTaxRate(Integer taxRate) {
        this.taxRate = taxRate;
    }

    
    @Column(name="TaxValue", length=100)
    public String getTaxValue() {
        return this.taxValue;
    }
    
    public void setTaxValue(String taxValue) {
        this.taxValue = taxValue;
    }

    
    @Column(name="InterestRate")
    public Integer getInterestRate() {
        return this.interestRate;
    }
    
    public void setInterestRate(Integer interestRate) {
        this.interestRate = interestRate;
    }

    
    @Column(name="InterestValue", precision=10)
    public BigDecimal getInterestValue() {
        return this.interestValue;
    }
    
    public void setInterestValue(BigDecimal interestValue) {
        this.interestValue = interestValue;
    }

    
    @Column(name="InterestAt")
    public Integer getInterestAt() {
        return this.interestAt;
    }
    
    public void setInterestAt(Integer interestAt) {
        this.interestAt = interestAt;
    }

    
    @Column(name="interest", precision=10)
    public BigDecimal getInterest() {
        return this.interest;
    }
    
    public void setInterest(BigDecimal interest) {
        this.interest = interest;
    }

    
    @Column(name="status", length=100)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }




}

