# bike-store-project

Deskripsi Proyek
Proyek ini bertujuan untuk mentransformasi data transaksi mentah menjadi strategi bisnis yang terukur melalui integrasi SQL, Python, dan Looker Studio. Alur kerja dimulai dengan proses data engineering menggunakan SQL untuk memastikan kebersihan dan kesiapan data dari database relasional.
Pada tahap analisis, proyek ini menerapkan tiga pendekatan Machine Learning: algoritma FP-Growth digunakan untuk mengungkap pola pembelian silang (cross-selling), sementara K-Means Clustering mengelompokkan pelanggan berdasarkan loyalitas dan perilaku belanja. Untuk perencanaan masa depan, model Prophet diimplementasikan guna memprediksi tren penjualan secara akurat dengan mempertimbangkan pola musiman.

Tech Stack & Alat
- Database: MySQL (Data Cleaning, Transformation, & EDA).
- Programming: Python (Pandas, Scikit-Learn, Matplotlib, Seaborn, mlxtend, prophet, statsmodel).
- BI Tool: Power BI Desktop, Tableau, Looker Studio.
- Library ML: FP-Growth, Kmeans, prohet.
  
Tahap 1: SQL Data Engineering & EDA
- Data Cleaning: Menggabungkan nama depan dan belakang pelanggan/staf, serta menangani *missing values* pada data pengiriman.
- Table Integration: Menggabungkan 9 tabel relasional (`orders`, `customers`, `products`, dll) menjadi satu tabel fakta `trans` menggunakan `INNER JOIN`.
- Deduplication: Menggunakan CTE dan `ROW_NUMBER()` untuk memastikan tidak ada transaksi ganda.
- Exploratory Data Analysis (EDA):
  - Menghitung performa staf dan toko.
  - Menganalisis *shipping time* (waktu pengiriman) menggunakan `DATEDIFF`.
  - Mengidentifikasi produk, brand, dan kategori dengan pendapatan tertinggi.

tahap 2: Product Affinity & Market Basket Analysis (FP-Growth)
Menggunakan algoritma FP-Growth (Frequent Pattern Growth) untuk menggali pola tersembunyi dalam transaksi pelanggan dan memahami keterkaitan antar produk.
- Output: Menghasilkan metrik Support, Confidence, dan Lift untuk menentukan kekuatan hubungan antar produk.
- Manfaat: Menentukan strategi Product Bundling (paket hemat) dan rekomendasi produk yang lebih akurat.

tahap 3: Customer Segmentation (K-Means)
Menggunakan teknik RFM (Recency, Frequency, Monetary) yang digabungkan dengan algoritma K-Means Clustering untuk mengelompokkan pelanggan.
- Output: Membagi pelanggan ke dalam 3 segmen (misal: Loyal, At-Risk, New) secara otomatis
- Manfaat: Membantu tim pemasaran membuat kampanye iklan yang tepat sasaran untuk tiap jenis pelanggan.
  
tahap 4: Forecast (Prophet)
Melakukan prediksi penjualan masa depan untuk membantu perencanaan stok dan target pendapatan.
- Output: Menghasilkan nilai prediksi (yhat) beserta rentang batas atas (yhat_upper) dan batas bawah (yhat_lower) sebagai margin keamanan statistik.
- Manfaat: Memberikan gambaran target penjualan yang realistis bagi manajemen untuk periode tertentu ke depan.
  
tahap 5: BI Dashboard (looker studio)
Dashboard interaktif yang menyatukan seluruh hasil analisis
