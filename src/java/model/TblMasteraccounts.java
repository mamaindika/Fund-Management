package model;
// Generated Nov 18, 2016 10:56:04 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TblMasteraccounts generated by hbm2java
 */
@Entity
@Table(name="tbl_masteraccounts"
    ,catalog="fund_manager"
)
public class TblMasteraccounts  implements java.io.Serializable {


     private int accountNo;
     private TblFundtypes tblFundtypes;
     private String accountName;
     private String currentLedger;
     private String typeOfAccount;
     private String status;
     private Set<TblAccountJournalmapping> tblAccountJournalmappings = new HashSet<TblAccountJournalmapping>(0);

    public TblMasteraccounts() {
    }

	
    public TblMasteraccounts(int accountNo) {
        this.accountNo = accountNo;
    }
    public TblMasteraccounts(int accountNo, TblFundtypes tblFundtypes, String accountName, String currentLedger, String typeOfAccount, String status, Set<TblAccountJournalmapping> tblAccountJournalmappings) {
       this.accountNo = accountNo;
       this.tblFundtypes = tblFundtypes;
       this.accountName = accountName;
       this.currentLedger = currentLedger;
       this.typeOfAccount = typeOfAccount;
       this.status = status;
       this.tblAccountJournalmappings = tblAccountJournalmappings;
    }
   
     @Id 

    
    @Column(name="accountNo", unique=true, nullable=false)
    public int getAccountNo() {
        return this.accountNo;
    }
    
    public void setAccountNo(int accountNo) {
        this.accountNo = accountNo;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="fundId")
    public TblFundtypes getTblFundtypes() {
        return this.tblFundtypes;
    }
    
    public void setTblFundtypes(TblFundtypes tblFundtypes) {
        this.tblFundtypes = tblFundtypes;
    }

    
    @Column(name="accountName", length=100)
    public String getAccountName() {
        return this.accountName;
    }
    
    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    
    @Column(name="currentLedger", length=100)
    public String getCurrentLedger() {
        return this.currentLedger;
    }
    
    public void setCurrentLedger(String currentLedger) {
        this.currentLedger = currentLedger;
    }

    
    @Column(name="typeOfAccount", length=100)
    public String getTypeOfAccount() {
        return this.typeOfAccount;
    }
    
    public void setTypeOfAccount(String typeOfAccount) {
        this.typeOfAccount = typeOfAccount;
    }

    
    @Column(name="status", length=100)
    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="tblMasteraccounts")
    public Set<TblAccountJournalmapping> getTblAccountJournalmappings() {
        return this.tblAccountJournalmappings;
    }
    
    public void setTblAccountJournalmappings(Set<TblAccountJournalmapping> tblAccountJournalmappings) {
        this.tblAccountJournalmappings = tblAccountJournalmappings;
    }




}


