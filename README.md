# bike-store-project

Deskripsi Proyek
Proyek ini merupakan analisis komprehensif terhadap ekosistem penjualan toko sepeda. Alur kerja dimulai dari pembersihan database relasional menggunakan sql, pemodelan prediktif untuk korelasi dan prediksi menggunakan machine learning dengan model random forest dan kmeans, dan diakhiri dengan pembuatan dashboard interaktif di power BI dan Tableau.

Tech Stack & Alat
- Database: MySQL (Data Cleaning, Transformation, & EDA).
- Programming: Python (Pandas, Scikit-Learn, Matplotlib, Seaborn).
- BI Tool: Power BI Desktop, Tableau.
- Library ML: Random Forest Regressor (Forecasting), Kmeans.
  
Tahap 1: SQL Data Engineering & EDA
- Data Cleaning: Menggabungkan nama depan dan belakang pelanggan/staf, serta menangani *missing values* pada data pengiriman.
- Table Integration: Menggabungkan 9 tabel relasional (`orders`, `customers`, `products`, dll) menjadi satu tabel fakta `trans` menggunakan `INNER JOIN`.
- Deduplication: Menggunakan CTE dan `ROW_NUMBER()` untuk memastikan tidak ada transaksi ganda.
- Exploratory Data Analysis (EDA):
  - Menghitung performa staf dan toko.
  - Menganalisis *shipping time* (waktu pengiriman) menggunakan `DATEDIFF`.
  - Mengidentifikasi produk, brand, dan kategori dengan pendapatan tertinggi.

tahap 2: Predictive Modeling (Machine Learning)
Menggunakan algoritma Random Forest Regressor untuk memprediksi jumlah penjualan (*Quantity*) di masa depan.
- Feature Engineering: Mengekstrak fitur `month` untuk menangkap pola musiman dan menggunakan *One-Hot Encoding* untuk fitur kategori.
- Feature Importance: Visualisasi untuk mengidentifikasi variabel utama (seperti Brand atau Kategori) yang paling mempengaruhi volume penjualan.

tahap 3: Customer Segmentation (RFM Analysis)
Menggunakan teknik RFM (Recency, Frequency, Monetary) yang digabungkan dengan algoritma K-Means Clustering untuk mengelompokkan pelanggan.
- Scaling: Menggunakan `StandardScaler` untuk normalisasi data.
- Clustering: Membagi pelanggan ke dalam 3 segmen otomatis untuk membantu tim pemasaran menentukan strategi *retention* yang tepat.
 tahap 4: Power BI Integration
Dashboard interaktif yang menyatukan seluruh hasil analisis
