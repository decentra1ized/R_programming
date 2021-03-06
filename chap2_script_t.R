#?€?2_1
# ?°?΄?° μ€λΉ?
exam <- read.csv("chap2_csv_data.csv")
# ?°?΄?° ???κΈ?
head(exam, 10) # ???λΆ?° 10 ?κΉμ? μΆλ ₯, μ§? ??λ©? 6?κΉμ?
tail(exam, 10) # ???λΆ?° 10 ?κΉμ? μΆλ ₯, μ§? ??λ©? 6?κΉμ?
dim(exam) # ?, ?΄ μΆλ ₯
str(exam) # ?°?΄?° ??± ??Έ
summary(exam) # ??½?΅κ³λ μΆλ ₯


#-------------------------------------------------------------------------------


#?°?΅2-1
library(ggplot2) #?¨?€μ§ λ‘λ
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)


#-------------------------------------------------------------------------------


#?€?2_2
# dplyr ?¨?€μ§ ?€μΉμ? λ‘λ & ?°?΄?° μ€λΉ?
# install.packages("dplyr")
library(dplyr)
exam <- read.csv("chap2_csv_data.csv")
# exam ?? class κ° 1 ?Έ κ²½μ°λ§? μΆμΆ??¬ μΆλ ₯
exam %>% filter(class == 1)
# ?¨μΆν€ [Ctrl+Shit+M]?Όλ‘? %>% κΈ°νΈ ?? ₯
# 1 λ°μ΄ ?? κ²½μ°
exam %>% filter(class != 1)
# μ΄κ³Ό, λ―Έλ§, ?΄?, ?΄? μ‘°κ±΄ κ±ΈκΈ°
# ?? ? ?κ° 50 ? ? μ΄κ³Ό? κ²½μ°
exam %>% filter(math > 50)
# 1 λ°? ?΄λ©΄μ ?? ? ?κ° 50 ?  ?΄??Έ κ²½μ°
exam %>% filter(class == 1 & math >= 50)
# ?? ? ?κ° 90 ?  ?΄??΄κ±°λ ??΄? ?κ° 90 ?  ?΄??Έ κ²½μ°
exam %>% filter(math >= 90 | english >= 90)
# λͺ©λ‘? ?΄?Ή?? ? μΆμΆ?κΈ?
exam %>% filter(class == 1 | class == 3 | class == 5) # 1, 3, 5 λ°μ ?΄?Ή?λ©? μΆμΆ
exam %>% filter(class %in% c(1,3,5)) # 1, 3, 5 λ°μ ?΄?Ή?λ©? μΆμΆ, %in% κΈ°νΈ ?΄?©
# μΆμΆ? ??Όλ‘? ?°?΄?° λ§λ€κΈ?
class1 <- exam %>% filter(class == 1) # class κ° 1 ?Έ ? μΆμΆ, class1 ? ? ?Ή
class2 <- exam %>% filter(class == 2) # class κ° 2 ?Έ ? μΆμΆ, class2 ? ? ?Ή
mean(class1$math) # 1 λ°? ?? ? ? ?κ·? κ΅¬νκΈ?
mean(class2$math) # 2 λ°? ?? ? ? ?κ·? κ΅¬νκΈ?


#-------------------------------------------------------------------------------


#?°?΅2_2
#2-2-1
mpg <- as.data.frame(ggplot2::mpg)

mpg_a <- mpg %>% filter(displ <= 4) #displ 4 ?΄? μΆμΆ
mpg_b <- mpg %>% filter(displ >= 5) #displ 5 ?΄? μΆμΆ
mean(mpg_a$hwy) #displ 4 ?΄? hwy ?κ·?
mean(mpg_b$hwy) #displ 5 ?΄? hwy ?κ·?

#2-2-2
mpg_audi <- mpg %>% filter(manufacturer == "audi") # audi μΆμΆ
mpg_toyota <- mpg %>% filter(manufacturer == "toyota") #toyota μΆμΆ
mean(mpg_audi$cty) # audi? cty ?κ·?
mean(mpg_toyota$cty) # toyota? cty ?κ·?

#2-2-3
#manufacturerκ° chevrolet, ford, honda? ?΄?Ή?λ©? μΆμΆ
mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)


#-------------------------------------------------------------------------------


#?€?2_3
# ??? λ³?λ§? μΆμΆ?κΈ?
exam %>% select(math) # math μΆμΆ
exam %>% select(class, math, english) # class, math, english λ³? μΆμΆ
exam %>% select(-math) # math ? ?Έ
exam %>% select(-math, -english) # math, english ? ?Έ
# dplyr ?¨? μ‘°ν©?κΈ?
# class κ° 1 ?Έ ?λ§? μΆμΆ? ?€? english μΆμΆ
exam %>% filter(class == 1) %>% select(english)


#-------------------------------------------------------------------------------


#?°?΅2_3
#2-3-1
mpg <- as.data.frame(ggplot2::mpg) # mpg ?°?΄?° λΆλ¬?€κΈ?

df <-mpg %>% select(class, cty) # class, cty μΆμΆ
head(df)

#2-3-2
df_suv <- df %>% filter(class == "suv") #classκ° suv?Έ ? μΆμΆ
df_compact <- df %>% filter(class == "compact") #classκ° compact?Έ ? μΆμΆ
mean(df_suv$cty) # suv? cty ?κ·?
mean(df_compact$cty) #compact? cty ?κ·?


#-------------------------------------------------------------------------------


#?€?2_4
# κ·Έλ£Ήλ³λ‘ ??½?κΈ?
exam %>% summarise(mean_math = mean(math)) # math ?κ·? ?°μΆ?
exam %>%
  group_by(class) %>% # class λ³λ‘ λΆλ¦¬
  summarise(mean_math = mean(math)) # math ?κ·? ?°μΆ?
# ?¬?¬ ??½?΅κ³λ ? λ²μ ?°μΆνκΈ?
exam %>%
  group_by(class) %>% # class λ³λ‘ λΆλ¦¬
  summarise(mean_math = mean(math), # math ?κ·?
            sum_math = sum(math), # math ?©κ³?
            median_math = median(math), # math μ€μκ°?
            n = n()) # ?? ?
# ?¬?¬κ°μ κ·Έλ£Ήλ³? ?¬?©?κΈ?
mpg %>%
  group_by(manufacturer, drv) %>% # ??¬λ³?, κ΅¬λ°©λ°©μλ³? λΆλ¦¬
  summarise(mean_cty = mean(cty)) %>% # cty ?κ·? ?°μΆ?
  head(10) # ?ΌλΆ μΆλ ₯


#-------------------------------------------------------------------------------


#?€?2_5
# ????λ‘? ? ? ¬?κΈ?
exam %>% arrange(math) # math ?€λ¦μ°¨? ? ? ¬
exam %>% arrange(desc(math)) # math ?΄λ¦Όμ°¨? ? ? ¬


#-------------------------------------------------------------------------------


#?°?΅2_4
#2-4-1
##library(dplyr)
##mpg <-  as.data.frame(ggplot2::mpg) #mpg ?°?΄?° λΆλ¬?€κΈ?
mpg %>%
  group_by(class) %>% #classλ³? λΆλ¦¬
  summarise(mean_cty = mean(cty)) # cty ?κ·? κ΅¬νκΈ?

#2-4-2
mpg %>%
  group_by(class) %>% #classλ³? λΆλ¦¬
  summarise(mean_city = mean(cty))  %>% # cty ?κ·? κ΅¬νκΈ?
  arrange(desc(mean_cty)) #?΄λ¦Όμ°¨? ? ??κΈ?
  
#2-4-3
mpg %>%
  group_by(class) %>% #classλ³? λΆλ¦¬
  summarise(mean_hwy = mean(hwy))  %>% # cty ?κ·? κ΅¬νκΈ?
  arrange(desc(mean_hwy))  %>%#?΄λ¦Όμ°¨? ? ??κΈ?
  head(3) #?? 3? μΆλ ₯
  
#2-4-4
mpg %>%
  filter(class == "compact")  %>%
  group_by(manufacturer) %>% #classλ³? λΆλ¦¬
  summarise(count = n())  %>% # cty ?κ·? κ΅¬νκΈ?
  arrange(desc(count)) #?΄λ¦Όμ°¨? ? ??κΈ?
  
  
#-------------------------------------------------------------------------------


#?€?2_6
#λ³? μΆκ??κΈ?
exam %>%
  mutate(total = math + english + science) # μ΄ν© λ³? μΆκ?
#?¬?¬κ°? λ³? μΆκ??κΈ?
exam %>%
  mutate(total = math + english + science, # μ΄ν© λ³? μΆκ?
         mean = (math + english + science)/3) # μ΄νκ·? λ³? μΆκ?
#μ‘°κ±΄λ¬ΈμΌλ‘? λ³? μΆκ??κΈ?
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail"))
exam %>%
  mutate(test = ifelse(science >= 90, "A", ifelse(science >= 60, "B", "C")))
#λ³?λ₯? μΆκ?? ?°?΄?° λ§λ€κΈ?
exam2 <- exam %>%
  mutate(test = ifelse(science >= 90, "A", ifelse(science >= 60, "B", "C")),
         mean = (math + english + science)/3)
exam2


#-------------------------------------------------------------------------------


#?°?΅2_5
#2-5-1
mpg_add <- mpg %>%
  mutate(total = cty + hwy, #?©?° λ³? λ§λ€κΈ?
        mean = total/2) %>% #?κ·? λ³? λ§λ€κΈ?
  arrange(desc(mean))
  
#2-5-2
mean(mpg_add$mean)

mpg_add <- mpg_add %>%
  mutate(group = ifelse(mean >= 20.14957, "H", "L"))

table(mpg_add$group)

