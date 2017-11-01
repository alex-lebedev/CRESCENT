#########################
# CS_LA5c_CompExtract.R #
#########################

# Calculation of composite scores for LA5c dataset
# Author: Alexander V. Lebedev
# Date: 2017-11-01

rm(list=ls())

# Libraries:
library(qgraph)
library(xlsx)
library(corrplot)
library(RColorBrewer)
color <- brewer.pal(n = 10, "RdYlBu")



# BEHAVIOUR:
pts <- read.csv('/Users/alebedev/Documents/R/LA5c/data/participants.tsv', sep='\t')
wms <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/wms.tsv', sep='\t')
wais <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/wais.tsv', sep='\t')
meds <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/medication.tsv', sep='\t')
eye <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/eysenck.tsv', sep='\t')
bis <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/barratt.tsv', sep='\t')
dem <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/demographics.tsv', sep='\t')
bart <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/bart.tsv', sep='\t')
stroop <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/stroop.tsv', sep='\t')
dkefs <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/dkefs.tsv', sep='\t')
ant <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/ant.tsv', sep='\t')
smnm <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/smnm.tsv', sep='\t')
tsw <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/taskswitch.tsv', sep='\t')
tci <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/tci.tsv', sep='\t')
dick <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/dickman.tsv', sep='\t')
cvlt <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/cvlt.tsv', sep='\t')

# Patients-only:
ham <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/hamilton.tsv', sep='\t')
hop <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/hopkins.tsv', sep='\t')
chaphyp <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/chaphyp.tsv', sep='\t')
ymrs <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/ymrs.tsv', sep='\t')
bprs <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/bprs.tsv', sep='\t')
saps <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/saps.tsv', sep='\t')
sans <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/sans.tsv', sep='\t')
bipol <- read.csv('/Users/alebedev/Documents/R/LA5c/data/phenotype/bipolar_ii.tsv', sep='\t')



dat <- merge(pts,wms, by ='participant_id',all=T)
dat <- merge(dat,wais, by ='participant_id',all=T)
dat <- merge(dat,bis, by ='participant_id' ,all=T)
dat <- merge(dat,dkefs, by ='participant_id' ,all=T)
dat <- merge(dat,chaphyp, by ='participant_id' ,all=T)
dat <- merge(dat,saps, by ='participant_id' ,all=T)
dat <- merge(dat,sans, by ='participant_id' ,all=T)
dat <- merge(dat,bprs, by ='participant_id' ,all=T)
dat <- merge(dat,ymrs, by ='participant_id' ,all=T)
dat <- merge(dat,ham, by ='participant_id' ,all=T)
dat <- merge(dat,bart, by ='participant_id' ,all=T)
dat <- merge(dat,cvlt, by ='participant_id' ,all=T)
dat <- merge(dat,eye, by ='participant_id' ,all=T)
dat <- merge(dat,meds, by ='participant_id' ,all=T)
dat <- merge(dat,hop, by ='participant_id' ,all=T)
dat <- merge(dat,bipol, by ='participant_id' ,all=T)

# Check:
# cor(dat[,c('chaphypo_total', 'ymrs_score', 'bis_factor1_ci', 'bis_factor2_bi', 'scorei')], use = 'complete.obs')


# coercing measures to numeric:
dat$chaphypo_total <- as.numeric(as.vector(dat$chaphypo_total))
dat$ymrs_score <- as.numeric(as.vector(dat$ymrs_score))
dat$bis_factor1_ci <- as.numeric(as.vector(dat$bis_factor1_ci))
dat$bis_factor2_bi <- as.numeric(as.vector(dat$bis_factor2_bi))
dat$scorei <- as.numeric(as.vector(dat$scorei))
dat$bprs_mania <- as.numeric(as.vector(dat$bprs_mania))

dat$factor_hallucinations <- as.numeric(as.vector(dat$factor_hallucinations))
dat$factor_delusions <- as.numeric(as.vector(dat$factor_delusions))
dat$factor_bizarrebehav <- as.numeric(as.vector(dat$factor_bizarrebehav))
dat$factor_inappaffect <- as.numeric(as.vector(dat$factor_inappaffect))
dat$factor_posformalthought <- as.numeric(as.vector(dat$factor_posformalthought))

dat$global_hallucinations <- as.numeric(as.vector(dat$global_hallucinations))
dat$global_delusions <- as.numeric(as.vector(dat$global_delusions))
dat$global_bizarrebehav <- as.numeric(as.vector(dat$global_bizarrebehav))
dat$global_inappaffect <- as.numeric(as.vector(dat$global_inappaffect))
dat$global_posformalthought <- as.numeric(as.vector(dat$global_posformalthought))
dat$bprs_positive <- as.numeric(as.vector(dat$bprs_positive))


dat$factor_avolition <- as.numeric(as.vector(dat$factor_avolition))
dat$factor_attention <- as.numeric(as.vector(dat$factor_attention))
dat$factor_alogia <- as.numeric(as.vector(dat$factor_alogia))
dat$factor_anhedonia <- as.numeric(as.vector(dat$factor_anhedonia))
dat$factor_bluntaffect <- as.numeric(as.vector(dat$factor_bluntaffect))

dat$global_bluntaffect <- as.numeric(as.vector(dat$global_bluntaffect))
dat$global_attention <- as.numeric(as.vector(dat$global_attention))
dat$global_alogia <- as.numeric(as.vector(dat$global_alogia))
dat$global_anhedonia <- as.numeric(as.vector(dat$global_anhedonia))
dat$global_avolition <- as.numeric(as.vector(dat$global_avolition))
dat$bprs_negative <- as.numeric(as.vector(dat$bprs_negative))


dat$hamd_28 <- as.numeric(as.vector(dat$hamd_28))
dat$bprs_depanx <- as.numeric(as.vector(dat$bprs_depanx))
dat$hopkins_depression <- as.numeric(as.vector(dat$hopkins_depression))
dat$hopkins_anxiety <- as.numeric(as.vector(dat$hopkins_anxiety))
dat$hopkins_obscomp <- as.numeric(as.vector(dat$hopkins_obscomp))



# Meds(?)
dat$med_use1 <- as.numeric(as.vector(dat$med_use1))
dat$med_dur1 <- as.numeric(as.vector(dat$med_dur1))

dat$med_dur1 <- as.numeric(as.vector(dat$med_dur1))

dat$med_dos1 <- as.numeric(as.vector(dat$med_dos1))
dat$med_dos1[dat$med_dos1<0] <- NA
dat$med_dos2 <- as.numeric(as.vector(dat$med_dos2))
dat$med_dos2[dat$med_dos2<0] <- NA

#cor(dat[,c('factor_avolition', 'factor_attention', 'factor_alogia', 'factor_anhedonia', 'factor_bluntaffect',
#          'global_avolition', 'global_attention', 'global_alogia', 'global_anhedonia', 'global_bluntaffect'
#           )], use = 'complete.obs')





# Gf:
gc <- apply(dat[,c('lns_totalraw','ds_totalraw','c', 'ssp_totalraw','mr_totalraw', 'voc_totalraw')],2,scale)
gc <- apply(gc,1,mean)
dat$gF <- gc

# Mania:
mSym <- dat[,c('participant_id',
                 'chaphypo_total','ymrs_score', 'bprs_mania')]

mSym <- mSym[complete.cases(mSym),]
mSym[,c('chaphypo_total','ymrs_score', 'bprs_mania')] <- 
  apply(mSym[,c('chaphypo_total','ymrs_score', 'bprs_mania')],2,scale)
mSym$ManComp <- apply(mSym[,c('chaphypo_total','ymrs_score', 'bprs_mania')],1,mean)
dat <- merge(dat, mSym[,c('participant_id', 'ManComp')], by='participant_id', all=T)

# Impulsivity:
iSym <- dat[,c('participant_id',
                 'bis_factor1_ci', 'bis_factor2_bi', 'scorei')]

iSym <- iSym[complete.cases(iSym),]
iSym[,c('bis_factor1_ci', 'bis_factor2_bi', 'scorei')] <- 
  apply(iSym[,c('bis_factor1_ci', 'bis_factor2_bi', 'scorei')],2,scale)
iSym$ImpComp <- apply(iSym[,c('bis_factor1_ci', 'bis_factor2_bi', 'scorei')],1,mean)
dat <- merge(dat, iSym[,c('participant_id', 'ImpComp')], by='participant_id', all=T)


# Positive symptoms:
pSym <- dat[,c('participant_id',
               'factor_hallucinations', 'factor_delusions','factor_bizarrebehav', 'factor_inappaffect', 'factor_posformalthought',
               'global_hallucinations', 'global_delusions','global_bizarrebehav', 'global_inappaffect', 'global_posformalthought',
               'bprs_positive')]

pSym <- pSym[complete.cases(pSym),]

pSym[,c('factor_hallucinations', 'factor_delusions','factor_bizarrebehav', 'factor_inappaffect', 'factor_posformalthought',
        'global_hallucinations', 'global_delusions','global_bizarrebehav', 'global_inappaffect', 'global_posformalthought',
        'bprs_positive')] <- apply(pSym[,c('factor_hallucinations', 'factor_delusions','factor_bizarrebehav', 'factor_inappaffect', 'factor_posformalthought',
                                          'global_hallucinations', 'global_delusions','global_bizarrebehav', 'global_inappaffect', 'global_posformalthought',
                                          'bprs_positive')],2,scale)

pSym$PosComp <- apply(pSym[,c('factor_hallucinations', 'factor_delusions','factor_bizarrebehav', 'factor_inappaffect', 'factor_posformalthought',
                              'global_hallucinations', 'global_delusions','global_bizarrebehav', 'global_inappaffect', 'global_posformalthought',
                              'bprs_positive')],1,mean)

dat <- merge(dat, pSym[,c('participant_id', 'PosComp')], by='participant_id', all=T)


# Negative symptoms:
nSym <- dat[,c('participant_id',
               'factor_avolition', 'factor_attention', 'factor_alogia', 'factor_anhedonia', 'factor_bluntaffect',
               'global_avolition', 'global_attention', 'global_alogia', 'global_anhedonia', 'global_bluntaffect',
               'bprs_negative')]

nSym <- nSym[complete.cases(nSym),]
nSym[,c('factor_avolition', 'factor_attention', 'factor_alogia', 'factor_anhedonia', 'factor_bluntaffect',
        'global_avolition', 'global_attention', 'global_alogia', 'global_anhedonia', 'global_bluntaffect',
        'bprs_negative')] <- apply(nSym[,c('factor_avolition', 'factor_attention', 'factor_alogia', 'factor_anhedonia', 'factor_bluntaffect',
                                        'global_avolition', 'global_attention', 'global_alogia', 'global_anhedonia', 'global_bluntaffect', 'bprs_negative')],2,scale)


nSym$NegComp <- apply(nSym[,c('factor_avolition', 'factor_attention', 'factor_alogia', 'factor_anhedonia', 'factor_bluntaffect',
                              'global_avolition', 'global_attention', 'global_alogia', 'global_anhedonia', 'global_bluntaffect',
                              'bprs_negative')],1,mean)


dat <- merge(dat, nSym[,c('participant_id', 'NegComp')], by='participant_id', all=T)


# Depression/Anxiety:
affSym <- dat[,c('participant_id',
               'hamd_28', 'bprs_depanx',
               'bipollarii_mood', 'bipollarii_anxiety',
               'hopkins_depression', 'hopkins_anxiety', 'hopkins_obscomp')]

affSym <- affSym[complete.cases(affSym),]
affSym[,c('hamd_28', 'bprs_depanx',
          'bipollarii_mood', 'bipollarii_anxiety',
          'hopkins_depression', 'hopkins_anxiety', 'hopkins_obscomp')] <- 
  apply(affSym[,c('hamd_28', 'bprs_depanx',
                  'bipollarii_mood', 'bipollarii_anxiety',
                  'hopkins_depression', 'hopkins_anxiety', 'hopkins_obscomp')],2,scale)
affSym$AffComp <- apply(affSym[,c('hamd_28', 'bprs_depanx',
                                  'bipollarii_mood', 'bipollarii_anxiety',
                                  'hopkins_depression', 'hopkins_anxiety', 'hopkins_obscomp')],1,mean)
dat <- merge(dat, affSym[,c('participant_id', 'AffComp')], by='participant_id', all=T)



# cor(dat[,c('Gf','PosComp','HypComp')], use = 'complete.obs')


M <- cor(dat[,c('gF','PosComp','NegComp','ManComp','ImpComp', 'AffComp')], use = 'complete.obs')
col <- colorRampPalette(c(color[10:1]))
corrplot(M, method="color", col=col(200),  
         type="upper", order=NULL, 
         addCoef.col = "black", # Add coefficient of correlation
         tl.col="black", tl.srt=45, #Text label color and rotation
         
         # hide correlation coefficient on the principal diagonal
         diag=FALSE 
)
