<?php

namespace Database\Seeders;

use App\Models\FasilitasHotel;
use Illuminate\Database\Seeder;

class FasilitasHotelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        FasilitasHotel::create([
            'nama_fasilitas_hotel' => 'Kolam Renang',
            'foto_fasilitas_hotel' => null,
            'deskripsi_fasilitas_hotel' => 'Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'
        ]);

        FasilitasHotel::create([
            'nama_fasilitas_hotel' => 'Restoran',
            'foto_fasilitas_hotel' => null,
            'deskripsi_fasilitas_hotel' => 'Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'
        ]);

        FasilitasHotel::create([
            'nama_fasilitas_hotel' => 'Parkir Luas',
            'foto_fasilitas_hotel' => null,
            'deskripsi_fasilitas_hotel' => 'Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'
        ]);

        FasilitasHotel::create([
            'nama_fasilitas_hotel' => 'Sarapan Pagi Gratis',
            'foto_fasilitas_hotel' => null,
            'deskripsi_fasilitas_hotel' => 'Non est quidem labore ut impedit distinctio et corrupti. Distinctio doloremque enim occaecati aut incidunt ad. Ab eos rerum et. Perspiciatis nesciunt laudantium officiis voluptate reprehenderit harum'
        ]);
    }
}
