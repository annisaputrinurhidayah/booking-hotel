@props(['label','name','type'=>'text','value'=>'','keterangan'=>'', 'onkeydown'=>''])
<div class="form-group row">
    <label class="col-4 col-form-label text-right"><?= $label ?></label>
    
    <div class="col">
    <input value="{{ old($name,$value) }}" type="{{ $type }}" class="form-control{{ $errors->has($name) ? ' is-invalid' : ''}}" name="{{ $name }}" onkeydown="{{ $onkeydown }}">
        @error($name)
            <div class="invalid-feedback">{{ $message }}</div>
        @enderror

        @if($keterangan)
        <div class="text-muted">
            <small>{{ $keterangan }}</small>
        </div>
        @endif
    </div>

</div>