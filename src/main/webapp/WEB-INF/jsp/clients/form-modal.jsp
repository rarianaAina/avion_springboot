<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="clientModal" class="hidden fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full">
    <div class="relative top-20 mx-auto p-5 border w-96 shadow-lg rounded-md bg-white">
        <div class="mt-3">
            <h3 class="text-lg font-medium leading-6 text-gray-900 mb-4">Nouveau Client</h3>
            <form id="clientForm" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Nom</label>
                    <input type="text" name="nom" required
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Prénom</label>
                    <input type="text" name="prenom" required
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Téléphone</label>
                    <input type="tel" name="telephone"
                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm">
                </div>
                <input type="hidden" name="pointsFidelite" value="0">
                <div class="flex justify-end space-x-3">
                    <button type="button" onclick="fermerModalClient()"
                            class="bg-gray-500 text-white px-4 py-2 rounded">
                        Annuler
                    </button>
                    <button type="submit"
                            class="bg-blue-500 text-white px-4 py-2 rounded">
                        Sauvegarder
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>