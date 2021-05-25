#?‹¤?–‰2_1
# ?°?´?„° ì¤€ë¹?
exam <- read.csv("chap2_csv_data.csv")
# ?°?´?„° ?ŒŒ?•…?•˜ê¸?
head(exam, 10) # ?•?—?„œë¶€?„° 10 ?–‰ê¹Œì?€ ì¶œë ¥, ì§€? •?•ˆ?•˜ë©? 6?–‰ê¹Œì?€
tail(exam, 10) # ?•?—?„œë¶€?„° 10 ?–‰ê¹Œì?€ ì¶œë ¥, ì§€? •?•ˆ?•˜ë©? 6?–‰ê¹Œì?€
dim(exam) # ?–‰, ?—´ ì¶œë ¥
str(exam) # ?°?´?„° ?†?„± ?™•?¸
summary(exam) # ?š”?•½?†µê³„ëŸ‰ ì¶œë ¥


#-------------------------------------------------------------------------------


#?—°?Šµ2-1
library(ggplot2) #?Œ¨?‚¤ì§€ ë¡œë“œ
mpg <- as.data.frame(ggplot2::mpg)

head(mpg)
tail(mpg)
dim(mpg)
str(mpg)
summary(mpg)


#-------------------------------------------------------------------------------


#?‹¤?–‰2_2
# dplyr ?Œ¨?‚¤ì§€ ?„¤ì¹˜ì?€ ë¡œë“œ & ?°?´?„° ì¤€ë¹?
# install.packages("dplyr")
library(dplyr)
exam <- read.csv("chap2_csv_data.csv")
# exam ?—?„œ class ê°€ 1 ?¸ ê²½ìš°ë§? ì¶”ì¶œ?•˜?—¬ ì¶œë ¥
exam %>% filter(class == 1)
# ?‹¨ì¶•í‚¤ [Ctrl+Shit+M]?œ¼ë¡? %>% ê¸°í˜¸ ?…? ¥
# 1 ë°˜ì´ ?•„?‹Œ ê²½ìš°
exam %>% filter(class != 1)
# ì´ˆê³¼, ë¯¸ë§Œ, ?´?ƒ, ?´?•˜ ì¡°ê±´ ê±¸ê¸°
# ?ˆ˜?•™ ? ?ˆ˜ê°€ 50 ? ?„ ì´ˆê³¼?•œ ê²½ìš°
exam %>% filter(math > 50)
# 1 ë°? ?´ë©´ì„œ ?ˆ˜?•™ ? ?ˆ˜ê°€ 50 ?  ?´?ƒ?¸ ê²½ìš°
exam %>% filter(class == 1 & math >= 50)
# ?ˆ˜?•™ ? ?ˆ˜ê°€ 90 ?  ?´?ƒ?´ê±°ë‚˜ ?˜?–´? ?ˆ˜ê°€ 90 ?  ?´?ƒ?¸ ê²½ìš°
exam %>% filter(math >= 90 | english >= 90)
# ëª©ë¡?— ?•´?‹¹?˜?Š” ?–‰ ì¶”ì¶œ?•˜ê¸?
exam %>% filter(class == 1 | class == 3 | class == 5) # 1, 3, 5 ë°˜ì— ?•´?‹¹?˜ë©? ì¶”ì¶œ
exam %>% filter(class %in% c(1,3,5)) # 1, 3, 5 ë°˜ì— ?•´?‹¹?•˜ë©? ì¶”ì¶œ, %in% ê¸°í˜¸ ?´?š©
# ì¶”ì¶œ?•œ ?–‰?œ¼ë¡? ?°?´?„° ë§Œë“¤ê¸?
class1 <- exam %>% filter(class == 1) # class ê°€ 1 ?¸ ?–‰ ì¶”ì¶œ, class1 ?— ?• ?‹¹
class2 <- exam %>% filter(class == 2) # class ê°€ 2 ?¸ ?–‰ ì¶”ì¶œ, class2 ?— ?• ?‹¹
mean(class1$math) # 1 ë°? ?ˆ˜?•™ ? ?ˆ˜ ?‰ê·? êµ¬í•˜ê¸?
mean(class2$math) # 2 ë°? ?ˆ˜?•™ ? ?ˆ˜ ?‰ê·? êµ¬í•˜ê¸?


#-------------------------------------------------------------------------------


#?—°?Šµ2_2
#2-2-1
mpg <- as.data.frame(ggplot2::mpg)

mpg_a <- mpg %>% filter(displ <= 4) #displ 4 ?´?•˜ ì¶”ì¶œ
mpg_b <- mpg %>% filter(displ >= 5) #displ 5 ?´?ƒ ì¶”ì¶œ
mean(mpg_a$hwy) #displ 4 ?´?•˜ hwy ?‰ê·?
mean(mpg_b$hwy) #displ 5 ?´?ƒ hwy ?‰ê·?

#2-2-2
mpg_audi <- mpg %>% filter(manufacturer == "audi") # audi ì¶”ì¶œ
mpg_toyota <- mpg %>% filter(manufacturer == "toyota") #toyota ì¶”ì¶œ
mean(mpg_audi$cty) # audi?˜ cty ?‰ê·?
mean(mpg_toyota$cty) # toyota?˜ cty ?‰ê·?

#2-2-3
#manufacturerê°€ chevrolet, ford, honda?— ?•´?‹¹?•˜ë©? ì¶”ì¶œ
mpg_new <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_new$hwy)


#-------------------------------------------------------------------------------


#?‹¤?–‰2_3
# ?•„?š”?•œ ë³€?ˆ˜ë§? ì¶”ì¶œ?•˜ê¸?
exam %>% select(math) # math ì¶”ì¶œ
exam %>% select(class, math, english) # class, math, english ë³€?ˆ˜ ì¶”ì¶œ
exam %>% select(-math) # math ? œ?™¸
exam %>% select(-math, -english) # math, english ? œ?™¸
# dplyr ?•¨?ˆ˜ ì¡°í•©?•˜ê¸?
# class ê°€ 1 ?¸ ?–‰ë§? ì¶”ì¶œ?•œ ?‹¤?Œ english ì¶”ì¶œ
exam %>% filter(class == 1) %>% select(english)


#-------------------------------------------------------------------------------


#?—°?Šµ2_3
#2-3-1
mpg <- as.data.frame(ggplot2::mpg) # mpg ?°?´?„° ë¶ˆëŸ¬?˜¤ê¸?

df <-mpg %>% select(class, cty) # class, cty ì¶”ì¶œ
head(df)

#2-3-2
df_suv <- df %>% filter(class == "suv") #classê°€ suv?¸ ?–‰ ì¶”ì¶œ
df_compact <- df %>% filter(class == "compact") #classê°€ compact?¸ ?–‰ ì¶”ì¶œ
mean(df_suv$cty) # suv?˜ cty ?‰ê·?
mean(df_compact$cty) #compact?˜ cty ?‰ê·?


#-------------------------------------------------------------------------------


#?‹¤?–‰2_4
# ê·¸ë£¹ë³„ë¡œ ?š”?•½?•˜ê¸?
exam %>% summarise(mean_math = mean(math)) # math ?‰ê·? ?‚°ì¶?
exam %>%
  group_by(class) %>% # class ë³„ë¡œ ë¶„ë¦¬
  summarise(mean_math = mean(math)) # math ?‰ê·? ?‚°ì¶?
# ?—¬?Ÿ¬ ?š”?•½?†µê³„ëŸ‰ ?•œ ë²ˆì— ?‚°ì¶œí•˜ê¸?
exam %>%
  group_by(class) %>% # class ë³„ë¡œ ë¶„ë¦¬
  summarise(mean_math = mean(math), # math ?‰ê·?
            sum_math = sum(math), # math ?•©ê³?
            median_math = median(math), # math ì¤‘ì•™ê°?
            n = n()) # ?•™?ƒ ?ˆ˜
# ?—¬?Ÿ¬ê°œì˜ ê·¸ë£¹ë³€?ˆ˜ ?‚¬?š©?•˜ê¸?
mpg %>%
  group_by(manufacturer, drv) %>% # ?šŒ?‚¬ë³?, êµ¬ë°©ë°©ì‹ë³? ë¶„ë¦¬
  summarise(mean_cty = mean(cty)) %>% # cty ?‰ê·? ?‚°ì¶?
  head(10) # ?¼ë¶€ ì¶œë ¥


#-------------------------------------------------------------------------------


#?‹¤?–‰2_5
# ?ˆœ?„œ??€ë¡? ? •? ¬?•˜ê¸?
exam %>% arrange(math) # math ?˜¤ë¦„ì°¨?ˆœ ? •? ¬
exam %>% arrange(desc(math)) # math ?‚´ë¦¼ì°¨?ˆœ ? •? ¬


#-------------------------------------------------------------------------------


#?—°?Šµ2_4
#2-4-1
##library(dplyr)
##mpg <-  as.data.frame(ggplot2::mpg) #mpg ?°?´?„° ë¶ˆëŸ¬?˜¤ê¸?
mpg %>%
  group_by(class) %>% #classë³? ë¶„ë¦¬
  summarise(mean_cty = mean(cty)) # cty ?‰ê·? êµ¬í•˜ê¸?

#2-4-2
mpg %>%
  group_by(class) %>% #classë³? ë¶„ë¦¬
  summarise(mean_city = mean(cty))  %>% # cty ?‰ê·? êµ¬í•˜ê¸?
  arrange(desc(mean_cty)) #?‚´ë¦¼ì°¨?ˆœ ? •?˜?•˜ê¸?
  
#2-4-3
mpg %>%
  group_by(class) %>% #classë³? ë¶„ë¦¬
  summarise(mean_hwy = mean(hwy))  %>% # cty ?‰ê·? êµ¬í•˜ê¸?
  arrange(desc(mean_hwy))  %>%#?‚´ë¦¼ì°¨?ˆœ ? •?˜?•˜ê¸?
  head(3) #?ƒ?œ„ 3?–‰ ì¶œë ¥
  
#2-4-4
mpg %>%
  filter(class == "compact")  %>%
  group_by(manufacturer) %>% #classë³? ë¶„ë¦¬
  summarise(count = n())  %>% # cty ?‰ê·? êµ¬í•˜ê¸?
  arrange(desc(count)) #?‚´ë¦¼ì°¨?ˆœ ? •?˜?•˜ê¸?
  
  
#-------------------------------------------------------------------------------


#?‹¤?–‰2_6
#ë³€?ˆ˜ ì¶”ê?€?•˜ê¸?
exam %>%
  mutate(total = math + english + science) # ì´í•© ë³€?ˆ˜ ì¶”ê?€
#?—¬?Ÿ¬ê°? ë³€?ˆ˜ ì¶”ê?€?•˜ê¸?
exam %>%
  mutate(total = math + english + science, # ì´í•© ë³€?ˆ˜ ì¶”ê?€
         mean = (math + english + science)/3) # ì´í‰ê·? ë³€?ˆ˜ ì¶”ê?€
#ì¡°ê±´ë¬¸ìœ¼ë¡? ë³€?ˆ˜ ì¶”ê?€?•˜ê¸?
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail"))
exam %>%
  mutate(test = ifelse(science >= 90, "A", ifelse(science >= 60, "B", "C")))
#ë³€?ˆ˜ë¥? ì¶”ê?€?•œ ?°?´?„° ë§Œë“¤ê¸?
exam2 <- exam %>%
  mutate(test = ifelse(science >= 90, "A", ifelse(science >= 60, "B", "C")),
         mean = (math + english + science)/3)
exam2


#-------------------------------------------------------------------------------


#?—°?Šµ2_5
#2-5-1
mpg_add <- mpg %>%
  mutate(total = cty + hwy, #?•©?‚° ë³€?ˆ˜ ë§Œë“¤ê¸?
        mean = total/2) %>% #?‰ê·? ë³€?ˆ˜ ë§Œë“¤ê¸?
  arrange(desc(mean))
  
#2-5-2
mean(mpg_add$mean)

mpg_add <- mpg_add %>%
  mutate(group = ifelse(mean >= 20.14957, "H", "L"))

table(mpg_add$group)

