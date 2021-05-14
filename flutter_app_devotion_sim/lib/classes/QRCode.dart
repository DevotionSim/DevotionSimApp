class QRCode {
  String _qrCode;
  bool _disabled;

  setQRCode(String code) {
    this._qrCode = code;
  }

  String getQRCode() {
    return this._qrCode;
  }

  setDisabled(bool disabled) {
    this._disabled = disabled;
  }

  bool isDisabled() {
    return this._disabled;
  }

  QRCode(String code) {
    this._qrCode = code;
  }
}