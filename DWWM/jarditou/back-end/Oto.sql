DROP DATABASE IF EXISTS Oto;

CREATE DATABASE Oto;

USE Oto;

CREATE TABLE clients (
    cli_ID inT AUTO_INCREMENT NOT NULL ,
    CONSTRAINT PRIMARY KEY (cli_ID)
);

CREATE TABLE vehicule_client (
    V_cli_ID int AUTO_INCREMENT NOT NULL,
    cli_ID int not NULL,
    CONSTRAINT PRIMARY KEY (V_cli_ID),
    CONSTRAINT FOREIGN KEY (cli_ID) REFERENCES clients(cli_ID)
);

CREATE TABLE roles (
    rol_ID int AUTO_INCREMENT NOT NULL,
    CONSTRAINT PRIMARY KEY (rol_ID)
);

CREATE TABLE  employes (
    emp_ID int AUTO_INCREMENT NOT NULL,
    rol_ID int NOT NULL,
    CONSTRAINT PRIMARY KEY (emp_ID),
    CONSTRAINT FOREIGN KEY (rol_ID) REFERENCES roles(rol_ID)
);

CREATE TABLE achat_vehicule (
    achat_V_ID int AUTO_INCREMENT NOT NULL,
    cli_ID int,
    emp_ID int,
    CONSTRAINT PRIMARY KEY (achat_V_ID),
    CONSTRAINT FOREIGN KEY (cli_ID) REFERENCES clients(cli_ID),
    CONSTRAINT FOREIGN KEY (emp_ID) REFERENCES employes(emp_ID)
);

CREATE TABLE vehicule_neuf (
    V_neuf_ID int AUTO_INCREMENT NOT NULL,
    achat_V_ID int,
    CONSTRAINT PRIMARY KEY (V_neuf_ID),
    CONSTRAINT FOREIGN KEY (achat_V_ID) REFERENCES achat_vehicule(achat_V_ID)
);

CREATE TABLE vehicule_occasion (
    V_ocas_ID int AUTO_INCREMENT NOT NULL,
    achat_V_ID int,
    CONSTRAINT PRIMARY KEY (V_ocas_ID),
    CONSTRAINT FOREIGN KEY (achat_V_ID) REFERENCES achat_vehicule(achat_V_ID)
);

CREATE TABLE achat_accessoire (
    achat_access_ID int AUTO_INCREMENT NOT NULL,
    cli_ID int,
    CONSTRAINT PRIMARY KEY (achat_access_ID),
    CONSTRAINT FOREIGN KEY (cli_ID) REFERENCES clients(cli_ID)
);

CREATE TABLE réparation_entretien_pose (
    REP_ID int AUTO_INCREMENT NOT NULL,
    cli_ID int,
    emp_ID int,
    CONSTRAINT PRIMARY KEY (REP_ID),
    CONSTRAINT FOREIGN KEY (cli_ID) REFERENCES clients(cli_ID),
    CONSTRAINT FOREIGN KEY (emp_ID) REFERENCES employes(emp_ID)
);

CREATE TABLE achat_option (
    achat_opt_ID int AUTO_INCREMENT NOT NULL,
    cli_ID int,
    emp_ID int,
    CONSTRAINT PRIMARY KEY (achat_opt_ID),
    CONSTRAINT FOREIGN KEY (cli_ID) REFERENCES clients(cli_ID),
    CONSTRAINT FOREIGN KEY (emp_ID) REFERENCES employes(emp_ID)
);

CREATE TABLE facture (
    fact_ID int AUTO_INCREMENT NOT NULL,
    achat_access_ID int,
    REP_ID int,
    achat_opt_ID int,
    achat_V_ID int,
    CONSTRAINT PRIMARY KEY (fact_ID),
    CONSTRAINT FOREIGN KEY (achat_access_ID) REFERENCES achat_accessoire(achat_access_ID),
    CONSTRAINT FOREIGN KEY (REP_ID) REFERENCES réparation_entretien_pose(REP_ID),
    CONSTRAINT FOREIGN KEY (achat_opt_ID) REFERENCES achat_option(achat_opt_ID),
    CONSTRAINT FOREIGN KEY (achat_V_ID) REFERENCES achat_vehicule(achat_V_ID)
);

CREATE TABLE facture_detaillés (
    fact_det_ID int AUTO_INCREMENT NOT NULL,
    fact_ID int NOT NULL,
    CONSTRAINT PRIMARY KEY (fact_det_ID),
    CONSTRAINT FOREIGN KEY (fact_ID) REFERENCES facture(fact_ID)
);