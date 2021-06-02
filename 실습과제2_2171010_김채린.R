#������Ʈ ���� = C:/R_programming
#����2_7
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
# qplot()�� ���
qplot(data = mpg, x = hwy)
# x �� cty
qplot(data = mpg, x = cty)
# x �� drv
qplot(data = mpg, x = drv)
# x �� drv, y �� hwy
qplot(data = mpg, x = drv, y = hwy)
# x �� drv, y �� hwy, ���� �׸� ����
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")
# x �� drv, y �� hwy, ���� �׸� ����, drv �� �� ǥ��
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)


#-------------------------------------------------------------------------------


#����2_8
# �� ���� �׷��� ����� - ggplot() / geom_bar()
# x �� ���� ����, y �� ��
ggplot(data = mpg, aes(x = drv)) + geom_bar()
# x �� ���� ����, y �� ��
ggplot(data = mpg, aes(x = hwy)) + geom_bar()


#-------------------------------------------------------------------------------


#����2_9
# ��� ���� �׷��� ����� ??? ggplot() / geom_col()
# 1. ���ܺ� ���ǥ �����
library(dplyr)
df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))
df_mpg
# 2. �׷��� �����ϱ�
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col() 
# �� ������ ��հ��� ���� ���̷� ǥ���� �׷���
# 3. ũ�� ������ �����ϱ�
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +
  geom_col()


#-------------------------------------------------------------------------------


#����2_10
# ���ڱ׸� �����
ggplot(data = mpg, aes(y = hwy)) + geom_boxplot()
# ���ܺ� ���ڱ׸� ���ϱ�
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()


#-------------------------------------------------------------------------------


#����2_6
#2-6-1
df <- mpg %>%
  filter(class == "suv") %>%
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty)) %>%
  arrange(desc(mean_cty)) %>%
  head(5)

df

ggplot(data = df, aes(x= reorder(manufacturer,-mean_cty), y=mean_cty)) + geom_col()

#2-6-2
ggplot(data = mpg, aes(x = class)) + geom_bar()

#2-6-3
class_mpg <- mpg %>%
  filter(class %in% c("compact", "subcompact", "suv"))
ggplot(data = class_mpg, aes(x = class, y = cty)) + geom_boxplot()

#-------------------------------------------------------------------------------


#����3_1
#����ǥ��T����

# ������ �غ�
exam <- read.csv("chap2_csv_data.csv")
library(dplyr)
# ������ �ľ��ϱ�
str(exam) # ������ �Ӽ� Ȯ��
#�ڷ��� ���� �۰�(<30) �������� ������ ���Ժ����� �ƴ϶�� ������ ������� ���

#�м��غ�
#���Լ�����(H0:�������� ������ ���Ժ��� vs H1:������ ������ ���Ժ����� �� �� ����)
shapiro.test(exam$math)
mean(exam$math)
# One Sample t-test
t.test(exam$math, mu = 60, alternative = "two.sided")
t.test(exam$math, mu = 60, alternative = "less")
t.test(exam$math, mu = 60, alternative = "greater")


#--------------------------------------------------------------------------------


#����3_2 
#����ǥ��T����

#�м��غ�
class(exam$class)
table(exam$class)

exam_2samt <- exam %>%
  mutate(class_g = ifelse(class %in% c(1, 2, 3), "A", "B"))
exam_2samt
class(exam_2samt$class_g)
#�л��� ������ ����: Levene's test
#��Ű����ġ
#install.packages("lawstat")
library(lawstat)
#levene�� ��л����(H0:�� ������ �л��� ���� vs H1:�� ������ �л��� �ٸ���)
levene.test(exam_2samt$math, exam_2samt$class_g, location="mean")
# Two Sample t-test
t.test(data = exam_2samt, math ~ class_g, var.equal = T)


#--------------------------------------------------------------------------------


#����3_3
#����ǥ��T����

#�м��غ�
math<- exam$math
english<- exam$english
# Paired t-test
t.test(math, english, paired = T)


#--------------------------------------------------------------------------------



#����3_1

#3-1-1
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

str(mpg)
table(mpg$class)

t.test(mpg$cty, mu=20, alternative = "two.sided")

#3-1-2
mpg_diff <- mpg %>%
  select(class, cty) %>%
  filter(class %in% c("compact", "suv"))

str(mpg_diff)
class(mpg_diff$class)

table(mpg_diff$class)

#�л��� ������ ���� : levene's test

#install.packages("lawstat")
library(lawstat)

levene.test(mpg_diff$cty, mpg_diff$class, location = "mean")

t.test(data = mpg_diff, cty ~ class, var.equal = T)


#3-1-3
#Paired t-test
cty <- mpg$cty
hwy <- mpg$hwy

t.test(cty, hwy, paired = T, alternative = "greater")


#-------------------------------------------------------------------------------


#����3_4
#������ �غ�
exam_p <- exam %>%
  mutate(math_g = ifelse(math>=80, "A",ifelse(math>=60, "B", "C")))
table(exam_p$math_g)
#Goodness of Fit test
chisq.test(table(exam_p$math_g), p=c(1/4, 2/4, 1/4))


#-------------------------------------------------------------------------------


#����3_5
#������ �غ�
exam_c <- exam %>%
  mutate(math_g = ifelse(math>=80, "A",ifelse(math>=60, "B", "C")),
         english_g = ifelse(english>=70, "A", "B"))
table(exam_c$math_g, exam_c$english_g)
#Chi square test of independence
chisq.test(table(exam_c$math_g, exam_c$english_g))


#-------------------------------------------------------------------------------


#����3_6
#������ �غ�
p_table = data.frame(black=20, silver=20, gold=35, pink=25, row.names="")
#Goodness of Fit test
chisq.test(p_table, p=c(1/4, 1/4, 1/4, 1/4))


#-------------------------------------------------------------------------------


#����3_7
#������ �غ�
c_table = data.frame(A=c(27, 77, 17), B=c(7, 53, 20), row.names=c("20", "30", "40"))
c_table
#Chi square test of independence
chisq.test(c_table)


#-------------------------------------------------------------------------------


#����3_2
#3-2-1
?mpg
mpg <- as.data.frame(ggplot2::mpg)
str(mpg)
mean(mpg$hwy)

quantile(mpg$hwy, p=0.1)
quantile(mpg$hwy, p=0.25)
quantile(mpg$hwy, p=0.5)
quantile(mpg$hwy, p=0.75)
quantile(mpg$hwy, p=0.9)

median(mpg$hwy)
min(mpg$hwy)
max(mpg$hwy)


mpg_chi1 <- mpg %>%
  mutate(hwy_g = ifelse(hwy <= 20, "A", ifelse(hwy <= 30, "B", "C")))

table(mpg_chi1$hwy_g)


chisq.test(table(mpg_chi1$hwy_g), p=c(2/7, 4/7, 1/7))

#3-2-2

mpg_chi2 <- mpg %>%
  mutate(hwy_g = ifelse(hwy <= 20, "A", ifelse(hwy <=20, "B", "C"))) %>% filter(class %in% c("compact", "midsize", "subcompact") & hwy_g != "A")

table(mpg_chi2$class, mpg_chi2$hwy_g)

chisq.test(table(mpg_chi2$class, mpg_chi2$hwy_g))

#3-2-3
c_table = data.frame(o=c(93, 55), c=c(72, 79), x=c(21,30), row.names=c("m", "f"))

c_table
chisq.test(c_table)
