<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Staff_controller extends CI_Controller {
	public function __construct(){
		parent::__construct();
		cek_staff_login();
		$this->load->library('form_validation');
		$this->load->model('staff_model');
	}
	public function page_admin_dashboard(){
		$data['tabel_staff'] = $this->db->get_where('tabel_staff', ['username' => $this->session->userdata('username')])->row_array();

		$event_aktif = $this->db->get_where('tabel_event', ['status' => 'active'])->row_array();
		$data['hitung_visitor'] = $this->db->get('tabel_visitor')->num_rows();
		$data['hitung_staff'] = $this->db->get_where('tabel_staff', ['verified' => '1'])->num_rows();
		$data['hitung_event'] = $this->db->get_where('tabel_event', ['status' => 'active'])->num_rows();
		$data['hitung_area'] = $this->db->get_where('tabel_area', ['id_event' => $event_aktif['id_event']])->num_rows();
		$data['hitung_visitor_loggedin'] = $this->db->get_where('tabel_visitor', ['status' => 'logged in'])->num_rows();
		$data['hitung_visitor_loggedout'] = $this->db->get_where('tabel_visitor', ['status' => 'logged out'])->num_rows();
		$data['hitung_visitor_inarea'] = $this->db->get_where('tabel_visitor', ['status' => 'in area'])->num_rows();
		$data['hitung_staff_online'] = $this->db->get_where('tabel_staff', ['is_active' => 'online'])->num_rows();
		$data['hitung_staff_offline'] = $this->db->get_where('tabel_staff', ['is_active' => 'offline'])->num_rows();
		$data['hitung_staff_admin'] = $this->db->get_where('tabel_staff', ['role_id' => '1'])->num_rows();
		$data['hitung_staff_petugas'] = $this->db->get_where('tabel_staff', ['role_id' => '2'])->num_rows();

		// echo 'selamat datang ' . $data['tb_user']['username'];
		$this->load->view('template/staff_only/header', $data);
		$this->load->view('template/staff_only/sidebar', $data);
		$this->load->view('template/staff_only/topbar', $data);
		$this->load->view('page/staff_only/admin/admin_dashboard', $data);
		$this->load->view('template/staff_only/footer', $data);
	}

	public function page_admin_tracking(){
		$data['tabel_staff'] = $this->db->get_where('tabel_staff', ['username' => $this->session->userdata('username')])->row_array();

		// echo 'selamat datang ' . $data['tb_user']['username'];
		$this->load->view('template/staff_only/header', $data);
		$this->load->view('template/staff_only/sidebar', $data);
		$this->load->view('template/staff_only/topbar', $data);
		$this->load->view('page/staff_only/admin/admin_tracking', $data);
		$this->load->view('template/staff_only/footer', $data);
	}

	public function page_admin_report(){
		$data['tabel_staff'] = $this->db->get_where('tabel_staff', ['username' => $this->session->userdata('username')])->row_array();

		// echo 'selamat datang ' . $data['tb_user']['username'];
		$this->load->view('template/staff_only/header', $data);
		$this->load->view('template/staff_only/sidebar', $data);
		$this->load->view('template/staff_only/topbar', $data);
		$this->load->view('page/staff_only/admin/admin_report', $data);
		$this->load->view('template/staff_only/footer', $data);
	}

	public function page_admin_daftar_staff(){
		$data['tabel_staff'] = $this->db->get_where('tabel_staff', ['username' => $this->session->userdata('username')])->row_array();
		$data['all_staff'] = $this->staff_model->get_tb_staff();
		$data['all_role'] = $this->staff_model->get_tb_role();
		$data['all_area'] = $this->staff_model->get_tb_area();

		$data['hitung_staff'] = $this->db->get_where('tabel_staff', ['verified' => '1'])->num_rows();
		$data['hitung_staff_admin'] = $this->db->get_where('tabel_staff', ['role_id' => '1'])->num_rows();
		$data['hitung_staff_petugas'] = $this->db->get_where('tabel_staff', ['role_id' => '2'])->num_rows();
		$data['hitung_staff_online'] = $this->db->get_where('tabel_staff', ['is_active' => 'online'])->num_rows();
		$data['hitung_staff_offline'] = $this->db->get_where('tabel_staff', ['is_active' => 'offline'])->num_rows();

		// echo 'selamat datang ' . $data['tb_user']['username'];
		$this->load->view('template/staff_only/header', $data);
		$this->load->view('template/staff_only/sidebar', $data);
		$this->load->view('template/staff_only/topbar', $data);
		$this->load->view('page/staff_only/admin/admin_daftar_staff', $data);
		$this->load->view('template/staff_only/footer', $data);
	}

	public function page_admin_data_list(){
		$data['tabel_staff'] = $this->db->get_where('tabel_staff', ['username' => $this->session->userdata('username')])->row_array();

		// echo 'selamat datang ' . $data['tb_user']['username'];
		$this->load->view('template/staff_only/header', $data);
		$this->load->view('template/staff_only/sidebar', $data);
		$this->load->view('template/staff_only/topbar', $data);
		$this->load->view('page/staff_only/admin/admin_data_list', $data);
		$this->load->view('template/staff_only/footer', $data);
	}

	public function page_admin_event_management(){
		$data['tabel_staff'] = $this->db->get_where('tabel_staff', ['username' => $this->session->userdata('username')])->row_array();

		// echo 'selamat datang ' . $data['tb_user']['username'];
		$this->load->view('template/staff_only/header', $data);
		$this->load->view('template/staff_only/sidebar', $data);
		$this->load->view('template/staff_only/topbar', $data);
		$this->load->view('page/staff_only/admin/admin_event', $data);
		$this->load->view('template/staff_only/footer', $data);
	}

	public function logout(){
		$log_stat = 'offline';
		$this->db->set('is_active', $log_stat);
		$this->db->where('staff_id', $this->session->userdata('staff_id'));
		$this->db->update('tabel_staff');

		$session_aktif = array('staff_id', 'role_id', 'username', 'password', 'nama', 'verified', 'is_active');
		$this->session->unset_userdata($session_aktif);
		// $this->session->sess_destroy();

		$this->session->set_flashdata('sukses', 'Anda sudah berhasil keluar !');
		redirect('staff_only/login');
	}

	public function crud_staff($mode, $staff_id){
		if($mode == "tambah"){
			if($this->input->is_ajax_request()){
	
				if($this->staff_model->validasi_form_tambah_staff() == true){
					// buat kostum id
						if($this->db->query('SELECT * FROM tabel_staff')->num_rows() > 0){
							$data = $this->db->query('SELECT * FROM tabel_staff')->num_rows();
							$kode = $data+1;
						}else{
							$kode = 1;
						}
						$tgl = mdate("%Y%m%d%H%i%s");
						$batas_user = str_pad($kode, 7, "0", STR_PAD_LEFT);
						$staff_id = "STF".$tgl.$batas_user;
	
					$this->staff_model->aksi_crud_staff("tambah", $staff_id);
	
					// Load ulang tabel_staff.php agar data yang baru bisa muncul di tabel pada admin_daftar_staff.php
	
					$total_staff = $this->db->get_where('tabel_staff', ['verified' => '1'])->num_rows();
					$total_staff_admin = $this->db->get_where('tabel_staff', ['role_id' => '1'])->num_rows();
					$total_staff_petugas = $this->db->get_where('tabel_staff', ['role_id' => '2'])->num_rows();
					$total_staff_online = $this->db->get_where('tabel_staff', ['is_active' => 'online'])->num_rows();
					$total_staff_offline = $this->db->get_where('tabel_staff', ['is_active' => 'offline'])->num_rows();
	
					$view_chart_status_staff = $this->load->view('chart/status_staff', array(
						'hitung_staff_online'=>$total_staff_online,
						'hitung_staff_offline'=>$total_staff_offline
					), true);
	
					$view_chart_total_staff = $this->load->view('chart/total_staff', array(
						'hitung_staff_admin'=>$total_staff_admin,
						'hitung_staff_petugas'=>$total_staff_petugas
					), true);
	
					$view_tabel_staff = $this->load->view('tabel/tabel_staff', array(
						'all_staff'=>$this->staff_model->get_tb_staff(),
						'all_role'=>$this->staff_model->get_tb_role(),
						'all_area'=>$this->staff_model->get_tb_area(),
					), true);
	
					$callback = array(
						'status'=>'sukses',
						'pesan'=>'Staff berhasil ditambahkan.',
						'total_staff'=>$total_staff,
						'total_staff_admin'=>$total_staff_admin,
						'total_staff_petugas'=>$total_staff_petugas,
						'view_chart_status_staff'=>$view_chart_status_staff,
						'view_chart_total_staff'=>$view_chart_total_staff,
						'view_tabel_staff'=>$view_tabel_staff
					);
				}else{
					$callback = array(
						'status'=>'gagal',
						'username_error' => form_error('username'),
						'password_error' => form_error('password'),
						'nama_error' => form_error('nama'),
						'jabatan_error' => form_error('jabatan'),
						// 'pesan'=>validation_errors()
					);
				}
				echo json_encode($callback);
			}
		}elseif($mode == "hapus"){
			if($this->input->is_ajax_request()){
				$this->staff_model->aksi_crud_staff("hapus", $staff_id); // panggil fungsi crud_member() di AdminModel
	
				// Load ulang tabel_staff.php agar data yang baru bisa muncul di tabel pada admin_daftar_staff.php
	
				$total_staff = $this->db->get_where('tabel_staff', ['verified' => '1'])->num_rows();
				$total_staff_admin = $this->db->get_where('tabel_staff', ['role_id' => '1'])->num_rows();
				$total_staff_petugas = $this->db->get_where('tabel_staff', ['role_id' => '2'])->num_rows();
				$total_staff_online = $this->db->get_where('tabel_staff', ['is_active' => 'online'])->num_rows();
				$total_staff_offline = $this->db->get_where('tabel_staff', ['is_active' => 'offline'])->num_rows();
	
				$view_chart_status_staff = $this->load->view('chart/status_staff', array(
					'hitung_staff_online'=>$total_staff_online,
					'hitung_staff_offline'=>$total_staff_offline
				), true);
	
				$view_chart_total_staff = $this->load->view('chart/total_staff', array(
					'hitung_staff_admin'=>$total_staff_admin,
					'hitung_staff_petugas'=>$total_staff_petugas
				), true);
	
				$view_tabel_staff = $this->load->view('tabel/tabel_staff', array(
					'all_staff'=>$this->staff_model->get_tb_staff(),
					'all_role'=>$this->staff_model->get_tb_role(),
					'all_area'=>$this->staff_model->get_tb_area(),
				), true);
	
				$callback = array(
					'status'=>'sukses',
					'pesan'=>'Staff berhasil dihapus.',
					'total_staff'=>$total_staff,
					'total_staff_admin'=>$total_staff_admin,
					'total_staff_petugas'=>$total_staff_petugas,
					'view_chart_status_staff'=>$view_chart_status_staff,
					'view_chart_total_staff'=>$view_chart_total_staff,
					'view_tabel_staff'=>$view_tabel_staff
				);
			}else{
				$callback = array(
					'status'=>'gagal'
				);
			}
			echo json_encode($callback);
		}
	}
}
?>
