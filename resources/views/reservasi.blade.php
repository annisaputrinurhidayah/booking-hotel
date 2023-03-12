@extends('layouts.tamu',['title'=>'Reservasi'])
@section('content')
<h1 class="text-center my-4">Reservasi</h1>
<div class="row">
    <div class="col-lg-8 offset-lg-2">
        
        <form method="post" action="?" class="card card-primary">
            <div class="card-header py-1"></div>
            <div class="card-body">
            <div class="form-group row">
                    <Label class="col-4 col-form-label text-right">Check IN</Label>
                    <div class="col">
                        <input id="checkin" value="{{ old('checkin') ? old('checkin') : request()->checkin }}" type="date" class="form-control {{ $errors->has('checkin') ? ' is-invalid' : ''}}" name="checkin">
                        @error('checkin')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>
                <div class="form-group row">
                    <Label class="col-4 col-form-label text-right">Check OUT</Label>
                    <div class="col">
                        <input id="checkout" value="{{ old('checkout') ? old('checkout') : request()->checkout }}" type="date" class="form-control {{ $errors->has('checkout') ? ' is-invalid' : ''}}" name="checkout">
                        @error('checkout')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                    </div>
                </div>

                <x-select-reservasi  label="Kamar" name="kamar" :data-option="$kamar"/>

                <div class="form-group row">
                    <div class="col-4"></div>
                    <div class="col" id="hargaSatuan">

                    </div>
                </div>
                <x-input-reservasi label="Jumlah Kamar" name="jumlah_kamar" type="number" :value="request()->jumlah" />
                <div class="form-group row">
                    <div class="col-4"></div>
                    <div class="col" id="harga">

                    </div>
                </div>
                <x-input-reservasi onkeydown="return /[a-z .,'-]/i.test(event.key)" label="Nama Pemesan" name="nama_pemesan"/>

                <x-input-reservasi label="Alamat Email" name="email" type="email" />

                <x-input-reservasi label="Nomor Handphone" name="nomor_handphone" />

                <x-input-reservasi onkeydown="return /[a-z .,'-]/i.test(event.key)" label="Nama Tamu" name="nama_tamu"/>
                <div id="groupTersedia">

                </div>
            </div>
            <div class="card-footer">
                <button class="btn btn-block btn-lg btn-primary w-75 m-auto" type="submit">
                    Booking Sekarang
                </button>
            </div>
        </form>
        <!-- ./card -->
    </div>
</div>
@endsection

@push('js')
<script>
    $(document).ready(function () {
        getKamar()
    });
    function getKamar() {
        let checkout = $('#checkout').val()
        let checkin = $('#checkin').val()
        let kamar = $('#kamar')
        let groupTersedia = $('#groupTersedia')
        let data = {
            'checkin': checkin,
            'checkout': checkout,
        }
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            type: "POST",
            url: "/reservasi/kamar",
            data: data,
            dataType: "json",
            success: function(response) {
                console.log(response)
                kamar.html("")
                let kosong = "";
                kamar.append('<option value="">Pilih</option>')
                $.each(response, function (indexInArray, valueOfElement) {
                    if (valueOfElement.id == {{ old('kamar') ? old('kamar') : 'kosong' }} ||  valueOfElement.id == {{ request()->kamar ? request()->kamar : 'kosong' }} ) {
                        kamar.append('<option selected value="'+valueOfElement.id+'">'+valueOfElement.nama_kamar+', tersedia : '+valueOfElement.jum_kamar+'</option>')
                    } else {
                        kamar.append('<option value="'+valueOfElement.id+'">'+valueOfElement.nama_kamar+', tersedia : '+valueOfElement.jum_kamar+'</option>')
                    }
                    groupTersedia.append('<input type="text" name="tersedia_'+valueOfElement.id+'" hidden value="'+valueOfElement.jum_kamar+'">')
                });
                getHargaKamar()
            }
        });

    }

    function getHargaKamar() {
        let checkout = $('#checkout').val()
        let checkin = $('#checkin').val()
        let kamar = $('#kamar')
        let harga = $('#harga')
        let hargaSatuan = $('#hargaSatuan')
        if (kamar.val() != "") {
            let data = {
                'checkin': checkin,
                'checkout': checkout,
                'kamar': kamar.val(),
                'jumlah_kamar': $('#jumlah_kamar').val()
            }
            harga.html("")
            hargaSatuan.html("")
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: "POST",
                url: "/reservasi/harga-kamar",
                data: data,
                dataType: "json",
                success: function(response) {
                    console.log(response)
                    let kosong = "";
                    if (response.harga_kamar) {
                        hargaSatuan.append('<p>Harga Kamar satuan : Rp. '+response.harga_kamar+'</p>')
                    }
                    if (response.total_malam) {
                        harga.append('<p>Total Malam : '+response.total_malam+'</p>')
                    }
                    if (response.total_harga) {
                        harga.append('<p>Total yang harus dibayar : Rp. '+response.total_harga+'</p>')
                    }
                }
            });
        } else {
            harga.html("")
        }
    }

    $('#checkout').on('input',function(e){
        e.preventDefault()
        getKamar()

    });

    $('#checkin').on('input',function(e){
        e.preventDefault()
        getKamar()

    });

    $('#kamar').on('input',function(e){
        e.preventDefault()
        getHargaKamar()
    });
    $('#jumlah_kamar').on('input',function(e){
        e.preventDefault()
            getHargaKamar()
    });
    
</script>
@endpush