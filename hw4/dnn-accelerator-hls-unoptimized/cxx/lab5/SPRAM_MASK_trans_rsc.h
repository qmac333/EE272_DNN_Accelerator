//
// Copyright 2003-2019 Siemens
//
#ifndef __INCLUDED_SPRAM_MASK_trans_rsc_H__
#define __INCLUDED_SPRAM_MASK_trans_rsc_H__
#include <mc_transactors.h>

template <
  int words
  ,int width
  ,int addr_width
  ,int num_byte_enables
  >
class SPRAM_MASK_trans_rsc : public mc_wire_trans_rsc_base<width,words>
{
public:
  sc_out< sc_lv<width> >   Q;
  sc_in< bool >   CLK;
  sc_in< sc_logic >   CSN;
  sc_in< sc_logic >   WEN;
  sc_in< sc_lv<addr_width> >   A;
  sc_in< sc_lv<width> >   D;
  sc_in< sc_lv<num_byte_enables> >   MASKN;

  typedef mc_wire_trans_rsc_base<width,words> base;
  MC_EXPOSE_NAMES_OF_BASE(base);

  SC_HAS_PROCESS( SPRAM_MASK_trans_rsc );
  SPRAM_MASK_trans_rsc(const sc_module_name &name, bool phase, double clk_skew_delay=0.0)
    : base(name, phase, clk_skew_delay)
    ,Q("Q")
    ,CLK("CLK")
    ,CSN("CSN")
    ,WEN("WEN")
    ,A("A")
    ,D("D")
    ,MASKN("MASKN")
    ,_is_connected_port_0(true)
    ,_is_connected_port_0_messaged(false) {
    SC_METHOD(at_active_clock_edge);
    sensitive << (phase ? CLK.pos() : CLK.neg());
    this->dont_initialize();

    MC_METHOD(clk_skew_delay);
    this->sensitive << this->_clk_skew_event;
    this->dont_initialize();
  }

  virtual void start_of_simulation() {
    if ((base::_holdtime == 0.0) && this->get_attribute("CLK_SKEW_DELAY")) {
      base::_holdtime = ((sc_attribute<double> *)(this->get_attribute("CLK_SKEW_DELAY")))->value;
    }
    if (base::_holdtime > 0) {
      std::ostringstream msg;
      msg << "SPRAM_MASK_trans_rsc CLASS_STARTUP - CLK_SKEW_DELAY = "
          << base::_holdtime << " ps @ " << sc_time_stamp();
      SC_REPORT_INFO(this->name(), msg.str().c_str());
    }
    reset_memory();
  }

  virtual void inject_value(int addr, int idx_lhs, int mywidth, sc_lv_base &rhs, int idx_rhs) {
    this->set_value(addr, idx_lhs, mywidth, rhs, idx_rhs);
  }

  virtual void extract_value(int addr, int idx_rhs, int mywidth, sc_lv_base &lhs, int idx_lhs) {
    this->get_value(addr, idx_rhs, mywidth, lhs, idx_lhs);
  }

private:
  void at_active_clock_edge() {
    base::at_active_clk();
  }

  void clk_skew_delay() {
    this->exchange_value(0);
    if (CSN.get_interface())
    { _CSN = CSN.read(); }
    if (WEN.get_interface())
    { _WEN = WEN.read(); }
    if (A.get_interface())
    { _A = A.read(); }
    else {
      _is_connected_port_0 = false;
    }
    if (D.get_interface())
    { _D = D.read(); }
    else {
      _is_connected_port_0 = false;
    }
    if (MASKN.get_interface())
    { _MASKN = MASKN.read(); }
    else {
      _is_connected_port_0 = false;
    }

    //  Write
    int _w_addr_port_0 = -1;
    if ( _is_connected_port_0 && (_CSN==0) && (_WEN==0) && (~_MASKN != 0)) {
      _w_addr_port_0 = get_addr(_A, "A");
      const int _slice_width = width / num_byte_enables;
      if (_w_addr_port_0 >= 0)
        for ( int _i = 0; _i < num_byte_enables; ++_i)
          if ( _MASKN[_i] == 0 )
          { inject_value(_w_addr_port_0, _i * _slice_width, _slice_width, _D, _i * _slice_width); }
    }
    if ( !_is_connected_port_0 && !_is_connected_port_0_messaged) {
      std::ostringstream msg;
      msg << "port_0 is not fully connected and writes on it will be ignored";
      SC_REPORT_WARNING(this->name(), msg.str().c_str());
      _is_connected_port_0_messaged = true;
    }

    //  Sync Read
    if ((_CSN==0)) {
      const int addr = get_addr(_A, "A");
      if (addr >= 0) {
        if (addr==_w_addr_port_0) {
          sc_lv<width> dc; // X
          _Q = dc;
        } else
        { extract_value(addr, 0, width, _Q, 0); }
      } else {
        sc_lv<width> dc; // X
        _Q = dc;
      }
    }
    if (Q.get_interface())
    { Q = _Q; }
    this->_value_changed.notify(SC_ZERO_TIME);
  }

  int get_addr(const sc_lv<addr_width> &addr, const char *pin_name) {
    if (addr.is_01()) {
      const int cur_addr = addr.to_uint();
      if (cur_addr < 0 || cur_addr >= words) {
#ifdef CCS_SYSC_DEBUG
        std::ostringstream msg;
        msg << "Invalid address '" << cur_addr << "' out of range [0:" << words-1 << "]";
        SC_REPORT_WARNING(pin_name, msg.str().c_str());
#endif
        return -1;
      } else {
        return cur_addr;
      }
    } else {
#ifdef CCS_SYSC_DEBUG
      std::ostringstream msg;
      msg << "Invalid Address '" << addr << "' contains 'X' or 'Z'";
      SC_REPORT_WARNING(pin_name, msg.str().c_str());
#endif
      return -1;
    }
  }

  void reset_memory() {
    this->zero_data();
    _CSN = SC_LOGIC_X;
    _WEN = SC_LOGIC_X;
    _A = sc_lv<addr_width>();
    _D = sc_lv<width>();
    _MASKN = sc_lv<num_byte_enables>();
    _is_connected_port_0 = true;
    _is_connected_port_0_messaged = false;
  }

  sc_lv<width>  _Q;
  sc_logic _CSN;
  sc_logic _WEN;
  sc_lv<addr_width>  _A;
  sc_lv<width>  _D;
  sc_lv<num_byte_enables>  _MASKN;
  bool _is_connected_port_0;
  bool _is_connected_port_0_messaged;
};
#endif // ifndef __INCLUDED_SPRAM_MASK_trans_rsc_H__


