ExchangeOffice.create!([
  {name: "Brollano", url_page: "http://www.brollano.cl/precios.html", message_id: nil, scraping_done: true},
  {name: "Afex", url_page: "http://www.afex.cl/prontus/simulator/changes.aspx", message_id: nil, scraping_done: nil}
])
Form.create!([
  {name: "Afex Venta", name_form: "simulador"},
  {name: "Afex Compra", name_form: "simulador"}
])
FormField.create!([
  {name: "asistente_RbCompraVenta_0", value: "", exist: true, type_form_field_id: 2, form_id: 1},
  {name: "asistente$ddlMoneda", value: "ARP", exist: true, type_form_field_id: 3, form_id: 1},
  {name: "asistente$txtMonto", value: "100", exist: true, type_form_field_id: 1, form_id: 1},
  {name: "asistente$ddlSucursal", value: "26", exist: true, type_form_field_id: 3, form_id: 1},
  {name: "asistente$txtNombre", value: "Diego", exist: true, type_form_field_id: 1, form_id: 1},
  {name: "asistente$txtTelefono", value: "932165487", exist: true, type_form_field_id: 1, form_id: 1},
  {name: "asistente$txtEmail", value: "diego@hotmail.com", exist: true, type_form_field_id: 1, form_id: 1},
  {name: "asistente$btnStep1", value: "COTIZAR", exist: false, type_form_field_id: 4, form_id: 1},
  {name: "asistente_RbCompraVenta_1", value: "", exist: true, type_form_field_id: 2, form_id: 2},
  {name: "asistente$ddlMoneda", value: "ARP", exist: true, type_form_field_id: 3, form_id: 2},
  {name: "asistente$txtMonto", value: "200", exist: true, type_form_field_id: 1, form_id: 2},
  {name: "asistente$ddlSucursal", value: "26", exist: true, type_form_field_id: 3, form_id: 2},
  {name: "asistente$txtNombre", value: "Pedro", exist: true, type_form_field_id: 1, form_id: 2},
  {name: "asistente$txtTelefono", value: "987954621", exist: true, type_form_field_id: 1, form_id: 2},
  {name: "asistente$txtEmail", value: "pedro@hotmail.com", exist: true, type_form_field_id: 1, form_id: 2},
  {name: "asistente$btnStep1", value: "COTIZAR", exist: false, type_form_field_id: 4, form_id: 2}
])
Money.create!([
  {name: "Peso Argentino"},
  {name: "Dolar Americano"}
])
PriceType.create!([
  {name: "Compra"},
  {name: "Venta"}
])
Scraping.create!([
  {scraping: "span.preciosmonedas", position: 6, exchange_office_id: 1, money_id: 1, form_id: nil, price_type_id: 2},
  {scraping: "span.preciosmonedas", position: 5, exchange_office_id: 1, money_id: 1, form_id: nil, price_type_id: 1},
  {scraping: "div.preciosmonedas", position: 2, exchange_office_id: 1, money_id: 2, form_id: nil, price_type_id: 1},
  {scraping: "div.preciosmonedas", position: 3, exchange_office_id: 1, money_id: 2, form_id: nil, price_type_id: 2},
  {scraping: ".caja-tabla .resultado-b", position: 1, exchange_office_id: 2, money_id: 1, form_id: 1, price_type_id: 2},
  {scraping: ".caja-tabla .resultado-b", position: 1, exchange_office_id: 2, money_id: 1, form_id: 2, price_type_id: 1}
])
TypeFormField.create!([
  {name: "Input"},
  {name: "Radio"},
  {name: "Select"},
  {name: "Nulo"}
])
