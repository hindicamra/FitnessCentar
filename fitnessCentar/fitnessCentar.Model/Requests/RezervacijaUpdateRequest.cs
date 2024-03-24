using System;
using System.ComponentModel.DataAnnotations;
using fitnessCentar.Model.Status;

namespace fitnessCentar.Model.Requests
{
	public class RezervacijaUpdateRequest
	{
      

        public StatusRezervacije Status { get; set; }
    }
}

