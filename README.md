# 🧩 SDP API  
**Software Implementation and Testing Course Project**  
Ruby on Rails 8.0.3 — API-only Application  

---

## 📘 Project Overview
SDP API (Scale Development Platform), **Ruby on Rails 8** framework’ü kullanılarak geliştirilmiş bir **API-only** web uygulamasıdır.  
Bu proje, **Yazılım Gerçekleme ve Test** dersi kapsamında; RESTful API mimarisini, model-veritabanı ilişkilerini ve API test süreçlerini uygulamalı olarak göstermeyi amaçlamaktadır.  

Uygulama; kullanıcıların (Users) anketler (Surveys) oluşturabildiği, bu anketlere sorular (Questions) ve ölçekler (Scales) ekleyebildiği, yanıtlama (Responses) yapabildiği modüler bir sistemdir.  
Tüm veri akışı JSON formatında gerçekleşir ve uygulamanın testi **Postman** üzerinden yürütülür.  

---

## ⚙️ Tech Stack

| Katman | Teknoloji |
|--------|------------|
| Backend Framework | **Ruby on Rails 8.0.3 (API-only mode)** |
| Dil | **Ruby 3.2.3** |
| Veritabanı | **SQLite3** (development ortamı) |
| Test Aracı | **Postman** |
| Çalışma Ortamı | **WSL2 (Ubuntu 24.04)** |
| Versiyon Kontrol | **Git + GitHub** |

---

## 🧱 Model Yapısı ve İlişkiler

Uygulamada 5 temel model bulunmaktadır:

| Model | İlişki | Açıklama |
|--------|---------|----------|
| **User** | has_many :surveys, has_many :questions | Sisteme kayıtlı kullanıcıları temsil eder. |
| **Survey** | belongs_to :user, has_many :responses | Kullanıcı tarafından oluşturulan anketleri ifade eder. |
| **Question** | belongs_to :user, belongs_to :scale | Anketlerdeki soruları temsil eder. |
| **Response** | belongs_to :survey | Katılımcıların verdikleri yanıtları içerir. |
| **Scale** | has_many :questions, has_many :surveys | Soru ve anketlerde kullanılan ölçekleri belirtir. |

### yUML Diyagramı

[User]1-0..*[Survey]
[User]1-0..*[Question]
[Scale]1-0..*[Survey]
[Scale]1-0..*[Question]
[Survey]1-0..*[Response]
🚀 Kurulum ve Çalıştırma

1️⃣ Ortam Kurulumu
sudo apt update
sudo apt install ruby-full sqlite3 git
gem install rails -v 8.0.3

2️⃣ Depoyu Klonla
git clone https://github.com/cerenazr/sdp_api.git
cd sdp_api

3️⃣ Bağımlılıkları Yükle
bundle install
rails db:migrate

4️⃣ Sunucuyu Başlat
bin/rails s -b 0.0.0.0

➡️ Uygulama http://localhost:3000 adresinde çalışacaktır.

## 📊 Test Süreci

API yapısı Postman üzerinde test edilmiştir.  
Tüm endpoint’ler `200 OK` veya `201 Created` durum kodlarıyla başarılı şekilde yanıt vermiştir.  
Test sürecinde; kullanıcı oluşturma, anket ekleme, soru ve ölçek ilişkilendirme işlemleri doğrulanmıştır.  

---

## 🧩 Değerlendirme

Bu çalışma kapsamında Ruby on Rails framework’ünün **API-only** yapısı kullanılarak bir backend uygulaması geliştirilmiştir.  
Modelleme, veri ilişkileri ve RESTful API tasarımı konularında uygulamalı deneyim kazanılmıştır.  
Proje, yazılım gerçekleme ve test sürecinin temel ilkelerine uygun olarak planlanmış ve test edilmiştir.  

---

## 👩‍💻 Geliştirici Bilgileri

**Ad Soyad:** Ceren Azar  
**Ders:** Yazılım Gerçekleme ve Test  
**Kurum:** Samsun Üniversitesi – Yazılım Mühendisliği Bölümü  
**E-posta:** cerenazar0@gmail.com  
**GitHub:** [github.com/cerenazr](https://github.com/cerenazr)
---
