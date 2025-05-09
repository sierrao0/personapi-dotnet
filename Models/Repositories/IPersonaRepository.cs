﻿using System.Collections.Generic;
using personapi_dotnet.Models.Entities;

namespace personapi_dotnet.Models.Repositories
{
    public interface IPersonaRepository
    {
        IEnumerable<Persona> GetAll();
        Persona GetById(int cc);
        void Add(Persona persona);
        void Update(Persona persona);
        void Delete(int cc);
    }
}
